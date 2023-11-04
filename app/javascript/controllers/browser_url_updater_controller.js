import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {params: Object}

  connect() {
    let url = new URL(window.location.href)
    let searchParams = url.searchParams
    this.removeBlankParams(searchParams)
    this.addParamsFromSession(searchParams)
    history.replaceState(null, '', url.href);
  }

  addParamsFromSession(searchParams) {
    Object.keys(this.paramsValue).forEach(key => {
      if (this.paramsValue[key]) {
        searchParams.append(key, this.paramsValue[key])
      } 
    })
  }

  removeBlankParams(searchParams) {
    let paramsToDelete = []
    for (const [key, value] of searchParams.entries()) {
      if (!value || Object.keys(this.paramsValue).includes(key)) {
         paramsToDelete.push(key)
      }
    }

    paramsToDelete.forEach(param => {
      console.log(param)
      searchParams.delete(param)
    })
  }
}
