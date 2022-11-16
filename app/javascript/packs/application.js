// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "trix"
import "@rails/actiontext"
import "../stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//teste
$(function(){
  'use strict'

  document.querySelector('#navbarSideCollapse').addEventListener('click', () => {
    document.querySelector('.offcanvas-collapse').classList.toggle('open')
  });
});

//Contador de caracteres
$(function() {
  $('#current').text($('.count-textarea').val().length);

  $('.count-textarea').on('keyup', function(){
    console.log('teste');
    var characterCount = $(this).val().length;
    $('#current').text(characterCount);
  });
});
