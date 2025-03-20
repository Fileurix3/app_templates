import { isCancel, text, spinner } from "@clack/prompts";
import { spawn } from "child_process";
import path from "path";
import fs from "fs";

export class CreateTemplate {
  private TEMPLATES_PATH: string = path.resolve(__dirname, "../templates");

  async createTemplate(): Promise<void> {
    const projectName: string = await this.getProjectName();
    const templateName: string = await this.getTemplateName();

    const templatePath: string = path.join(
      this.TEMPLATES_PATH,
      templateName.toString(),
      "template.sh",
    );

    const bashScript = spawn("bash", [templatePath, projectName.toString()]);

    const s = spinner();
    s.start("Template creation...");

    bashScript.stderr.on("error", (err) => {
      console.error(`Error: ${err}`);
    });

    bashScript.on("close", async (code) => {
      if (code == 0) {
        s.stop("Template has been successfully created");
      } else {
        s.stop("Template creation failed.");
        console.error(`Template creation failed with exit code ${code}`);
      }
    });
  }

  private async getProjectName(): Promise<string> {
    const projectName: string | symbol = await text({
      message: "Enter your project name",
      placeholder: "Your project name",
      validate(value) {
        if (value.length == 0) return `Name is required!`;
      },
    });

    if (isCancel(projectName)) {
      console.log("You canceled this process");
      process.exit(1);
    }

    return projectName.toString();
  }

  private async getTemplateName(): Promise<string> {
    const templatesPath = path.resolve(__dirname, "../templates");

    const templateName: string | symbol = await text({
      message: "Enter a template name",
      placeholder: "template name",
      validate(value) {
        if (value.length == 0) return `Template is required!`;
        if (!fs.existsSync(`${templatesPath}/${value}`)) {
          return "This template wasn't found!";
        }
      },
    });

    if (isCancel(templateName)) {
      console.log("You canceled this process");
      process.exit(1);
    }

    return templateName.toString();
  }
}
