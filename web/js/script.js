$(function () {
  var actionContainer = $(".actionmenu");

  window.onload = function () {
    actionContainer.fadeOut();
    //PreencherTabelaOuro(100, 522, 645, 125, 485, 126, 125, 354, 365, 154);
  };

  window.addEventListener('message', function (event) {
    if (event.data.action == "showMenu") {
      actionContainer.fadeIn();
    } else {
      actionContainer.fadeOut();
    }
  })

  document.onkeyup = function (data) {
    if (data.which == 27) {
      if (actionContainer.is(":visible")) {
        sendData("Close", "fechar");
      }
    }
  };
})
