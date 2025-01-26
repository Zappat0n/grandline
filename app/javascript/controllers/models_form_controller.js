import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["variablesContainer", "variablesTemplate", "fileContent"]

  fileChosen(event) {
    const file = event.target.files[0]
    if (file) {
      const reader = new FileReader();
      reader.onload = (e) => {
        const content = e.target.result.split("\n");
        if (confirm(`Are you sure you want to import ${content.length - 1} records with the following variables: ${content[0].replaceAll(",", ", ")}`)) {
          this.fileContentTarget.value = e.target.result
          content[0].split(",").forEach((variable) => {
            const content = this.variablesTemplateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().getTime())
            this.variablesContainerTarget.insertAdjacentHTML("beforeend", content)
            this.variablesContainerTarget.lastElementChild.querySelector("input").value = variable
          });
        }
      };
      reader.readAsText(file);
    }
  }

  addVariable(event) {
    event.preventDefault()
    const content = this.variablesTemplateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().getTime())
    this.variablesContainerTarget.insertAdjacentHTML("beforeend", content)
  }

  removeVariable(event) {
    event.preventDefault()
    const item = event.target.closest(".nested-fields")
    if (item) {
      item.remove()
    }
  }
}

