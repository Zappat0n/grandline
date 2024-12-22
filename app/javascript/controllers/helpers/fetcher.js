export class Fetcher {
  constructor({ parseErrorResponse = false, form = undefined } = {}) {
    this.parseErrorResponse = parseErrorResponse;
    this.form = form;
  }

  parseJSON = (res) => {
    if (res.status === 204 || res.status === 205) return Promise.resolve();

    return res.json();
  };

  checkStatus = (res) => {
    if (res.ok || this.parseErrorResponse) {
      return res;
    } else {
      throw new Error(res.statusText);
    }
  };

  csrfToken = () => {
    if (this.form) {
      return this.form
        .querySelector('input[type=hidden][name="authenticity_token"]')
        .getAttribute("value");
    } else {
      const metaTag = document.querySelector("meta[name='csrf-token']");

      return metaTag ? metaTag.getAttribute("content") : null;
    }
  };

  request = (path, params) => {
    params.credentials = "same-origin";
    params.headers = params.headers || {};
    params.headers["X-CSRF-Token"] =
    params.headers["X-CSRF-Token"] || this.csrfToken();
    params.headers["Accept"] = params.headers["Accept"] || "application/json";

    return fetch(path, params).then(this.checkStatus).then(this.parseJSON);
  };
}
