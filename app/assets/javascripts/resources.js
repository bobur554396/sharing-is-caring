// # // Set up preview.
$('#url').preview({key:'3f5f5238235c4d9896c4e6e596e74ed1'})


// # // On submit add hidden inputs to the form.
$('form').on('submit', function(){
  $(this).addInputs($('#url').data('preview'));
  return true;
});

