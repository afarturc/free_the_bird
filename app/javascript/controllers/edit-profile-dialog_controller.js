import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["dialog"]

    showEdit () {
        console.log("show");
        this.dialogTarget.showModal();
    }

    closeEdit () {
        const dialog = this.dialogTarget;
        console.log("close");
        dialog.close();
    }
}