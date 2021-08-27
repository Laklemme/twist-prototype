import { Controller } from "stimulus";

let running

export default class extends Controller {
  static targets = ['timer', 'symbol', 'left', 'right'];

  connect() {
    this.initializeTimer();
    this.runTimer();
  }

  initializeTimer() {
    const startTime = 15;

    this.timerTarget.innerHTML = startTime;
  }

  runTimer() {
    this.timer = setInterval(() => {
      running = true
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

  pause(click) {
    if (running) {
      this.leftTarget.classList.add("paused")
      this.rightTarget.classList.add("paused")
      this.timer = clearInterval(this.timer);
      running = false
      this.symbolTarget.outerHTML = '<i class="fas fa-play" data-display-timer-target="symbol"></i>';
    } else {
      this.leftTarget.classList.remove("paused")
      this.rightTarget.classList.remove("paused")
      this.runTimer();
      running = true
      this.symbolTarget.outerHTML = '<i class="fas fa-pause" data-display-timer-target="symbol"></i>';
    }
  }

}
