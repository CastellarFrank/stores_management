// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require_self

jQuery(function($) {
    $(document).on("ajax:success","#new_payment",function(e,data,status,xhr){
        alert("curious");
        $(".js_loan_payments").prepend(data);
        $("#payment_amount").val("");
    });

    $(document).on("ajax:error","#new_payment",function(e, xhr, status, error){
        alert("Something Wrong: " + xhr.responseText);
    });
});