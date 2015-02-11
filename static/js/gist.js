var delete_gist = function(){
}

var save = function(){
    var title = $("input.title").val();
    var content = editor.codemirror.getValue();
    $.post("/gist",
          {
              title: title,
              content: content,
          },
          function(data, status){
              console.log(status);
              window.location.href = "/";
          });
};

var cancel = function(){
    window.Location.herf = "/";
}
