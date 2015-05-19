$(document).ready(function(){

  var rotation = 0;

  jQuery.fn.rotate = function(degrees) {
      $(this).css({'-webkit-transform' : 'rotate('+ degrees +'deg)',
                   '-moz-transform' : 'rotate('+ degrees +'deg)',
                   '-ms-transform' : 'rotate('+ degrees +'deg)',
                   'transform' : 'rotate('+ degrees +'deg)'});
  };

  setInterval(function(){
    $('.triangulate').animate({
      borderWidth: '30px',
      opacity: 0.3,
      height: '5px',
      width: '5px',
      borderStyle: 'dashed'
    }, {
    duration: 1500,
      step: function(){
        rotation += 1.6;
      $('.triangulate').rotate(rotation)}
    });

    $('.triangulate').animate({
      borderWidth: '15px',
      opacity: 0.75,
      height: '10px',
      width: '10px',
      borderStyle: 'dashed'
    },{
    duration: 1500,
      step: function(){
        rotation += 1.6;
      $('.triangulate').rotate(rotation)}
    });
  }, 3000);

})
