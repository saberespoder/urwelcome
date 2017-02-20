$(document).ready(function() {
  $('#signup-form').bootstrapValidator({
      // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
      feedbackIcons: {
          valid: 'glyphicon glyphicon-ok',
          invalid: 'glyphicon glyphicon-remove',
          validating: 'glyphicon glyphicon-refresh'
      },
      fields: {
          name: {
              container: '#nameMessage',
              validators: {
                  stringLength: {
                      min: 2,
                  },
                  notEmpty: {
                      message: 'Please enter your name'
                  }
              }
          },
          email: {
              container: '#emailMessage',
              validators: {
                  notEmpty: {
                      message: 'Please enter your email address'
                  },
                  emailAddress: {
                      message: 'Please enter a valid email address'
                  }
              }
          }
        }
      })
      .on('success.form.bv', function(e) {
          $("#successModal").modal();
          $('#signup-form').data('bootstrapValidator').resetForm();

          // Prevent form submission
          e.preventDefault();

          // Get the form instance
          var $form = $(e.target);

          // Get the BootstrapValidator instance
          var bv = $form.data('bootstrapValidator');

          // Use Ajax to submit form data
          $.post($form.attr('action'), $form.serialize(), function(result) {
              console.log(result);
          }, 'json');
      });
});
