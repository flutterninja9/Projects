window.onload = initAll;

function initAll() {
	submit=document.getElementById('submitbtn');
	submit.onclick=saveBook;


}



function saveBook() {

	var bookName=document.getElementById('bookname').value;
	var bookPrice=document.getElementById('bookprice').value;
	var bookPage=document.getElementById('bookpages').value;
	var bookPub=document.getElementById('publisher').value;

	var url="/save_book?name="+bookName+"&price="+bookPrice+"&bookpage="+bookPage+"&publisher="+bookPub;

	var req = new XMLHttpRequest();
  req.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
    	alert(req.responseText);
    }
  };
  req.open("GET", url, true);
  req.send();
}



