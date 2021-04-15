const buildHTML = (XHR) => {
  const comment = XHR.response.post;
  const html = `
    <li class="comments_list">
      ${ comment.text }
    </li>`;
  return html
}

function post (){
  const submit = document.getElementById("submit");
  submit.addEventListener('click', (e) => {
    e.preventDefault();
    const commentForm = document.getElementById("comment_form")
    const formData = new FormData(commentForm);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/posts/1/comments", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}` );
        return null;
      }
      const commentsList = document.getElementById("comments_list");
      const commentText = document.getElementById("comment_text");
      commentsList.insertAdjacentHTML("beforebegin", buildHTML(XHR));
      commentText.value = "";
    };
  });
}

 window.addEventListener('load', post);