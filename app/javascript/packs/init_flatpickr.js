// First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.
 function initflatpickr() {

  const startTimeInput = document.getElementById('booking_start_time');
  const endTimeInput = document.getElementById('booking_end_time');

    // Check that the query selector id matches the one you put around your form.
  if (startTimeInput) {
    const unavailableTimes = JSON.parse(document.querySelector('#trainer-booking-time').dataset.unavailable)
    endTimeInput.disabled = true

    flatpickr(startTimeInput, {
      minTime: "today",
      disable: unavailableTimes,
      dateFormat: "Y-m-d",
    });

    console.log('im in the file')

    startTimeInput.addEventListener("change", (e) => {
      if (startTimeInput != "") {
        endTimeInput.disabled = false
      }
      flatpickr(endTimeInput, {
        minTime: e.target.value,
        disable: unavailableTimes,
        dateFormat: "Y-m-d"
      });
    })
  };
}

export {initflatpickr};
