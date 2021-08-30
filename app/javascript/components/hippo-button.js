import gsap from "gsap";


// ------------
// Mouse events
// ------------
const initiateHippoButton = () => {

  const button = document.querySelector('.hippo-button');
  if (button) {
    button.addEventListener('mouseenter', enterButton);
    button.addEventListener('mouseleave', leaveButton);

    function enterButton() { mouthOpen.play(); }
    function leaveButton() { mouthOpen.reverse(); }

    // --------------
    // Hover animaton
    // --------------

    const mouthSpeed = 0.3;
    const easeType = "power2";
    const mouthOpen = gsap.timeline({ paused: true });
    mouthOpen.to('.mouth-back', mouthSpeed, { ease: easeType, y: -70 }, 0);
    mouthOpen.to('.tongue', mouthSpeed + (mouthSpeed * 0.50), { ease: easeType, y: -70 }, 0);
    mouthOpen.to('.teeth', mouthSpeed, { ease: easeType, y: -70, scaleY: 1.2 }, 0);
    mouthOpen.to('.body', mouthSpeed, { ease: easeType, scaleY: 1.06, transformOrigin: 'center bottom' }, 0);
    mouthOpen.to('.freckles', mouthSpeed, { ease: easeType, y: -10 }, 0);
    mouthOpen.to('.ears', mouthSpeed, { ease: easeType, y: 6 }, 0);
    mouthOpen.to('.eye-right', mouthSpeed, { ease: easeType, x: -2 }, 0);
    mouthOpen.to('.eye-left', mouthSpeed, { ease: easeType, x: 2 }, 0);
    mouthOpen.to('.eyes', mouthSpeed, { ease: easeType, y: 2 }, 0);
    mouthOpen.to('.nostrils', mouthSpeed, { ease: easeType, y: -6 }, 0);

    // ----------
    // Ear wiggle
    // ----------

    const earWiggle = gsap.timeline({ paused: true });
    earWiggle.set('.ear-right', { transformOrigin: "center center" });
    earWiggle.to('.ear-right', 0.1, { rotation: 45 });
    earWiggle.to('.ear-right', 0.1, { rotation: 0 });
    earWiggle.to('.ear-right', 0.1, { rotation: 45 });
    earWiggle.to('.ear-right', 0.1, { rotation: 0 });
    earWiggle.to('.ear-right', 0.1, { rotation: 45 });
    earWiggle.to('.ear-right', 0.1, { rotation: 0 });

    window.setInterval(() => earWiggle.play(0), 3500);

    // ------------
    // Eye tracking
    // ------------

    const eyeRightPupil = document.querySelector('.eye-right-pupil');
    const eyeLeftPupil = document.querySelector('.eye-left-pupil');
    const eyeLeftInner = document.querySelector('.eye-left-inner');
    const innerEyeWidth = eyeLeftInner.getBoundingClientRect().width;
    const innerEyeHeight = eyeLeftInner.getBoundingClientRect().height;
    const pupilWidth = eyeLeftPupil.getBoundingClientRect().width;
    const pupilHeight = eyeLeftPupil.getBoundingClientRect().height;

    window.addEventListener('mousemove', updateEyePosition);

    function updateEyePosition(e) {
      const mousePercentX = e.clientX / document.body.clientWidth;
      const mousePercentY = e.clientY / document.body.clientHeight;
      const posX = (mousePercentX * 2 - 1) * (innerEyeWidth - pupilWidth) / 2;
      const posY = (mousePercentY * 2 - 1) * (innerEyeHeight - pupilHeight) / 2;

      eyeLeftPupil.style.transform = `translate(${posX}px, ${posY}px)`;
      eyeRightPupil.style.transform = `translate(${posX}px, ${posY}px)`;

    }
  }
}
export {initiateHippoButton}
