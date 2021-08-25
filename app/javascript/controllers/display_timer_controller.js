import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['timer'];

  connect() {
    this.initializeTimer();
    this.runTimer();
  }

  initializeTimer() {
    const startTime = 15;

    this.timerTarget.innerHTML = startTime;
  }

  runTimer() {
    setInterval(() => {
      // stuff that happens every second
      const currentTime = parseInt(this.timerTarget.innerText);
      // get the current time that is on the page
      // convert that to a number
      if (currentTime > 0) {
        const newTime = currentTime - 1;
        // subtract one
        this.timerTarget.innerHTML = newTime;
      // change what shows on the page
      } else {
        window.location.href = window.location.href + "/options";
      }
    }, 1000);
  }

  pause() {

  }
}
