<a href="javascript:void(0);" id="goKakao"
   style="position:fixed; bottom: 20px; right: 20px; z-index: 999"
   title="kakao" onclick="popupWindow('http://pf.kakao.com/_wYcdn/chat', 'My Popup', 800, 750);">
   
  <img src="https://d14b80fsv1tvpk.cloudfront.net/logo/RENTALLY_Character_kakao.png?w=100&h=100&f=webp&q=80" width="100px" alt="kakao"/>
</a>

<script>

function popupWindow(url, title, width, height) {

    var popupWidth = width;
    var popupHeight = height;

    var popupX = Math.round(window.screenX + (window.outerWidth/2) - (popupWidth/2));
    var popupY = Math.round(window.screenY + (window.outerHeight/2) - (popupHeight/2));

    var featureWindow = "width=" + popupWidth + ", height="+popupHeight
                      + ", left=" + popupX + ", top=" + popupY;

    return window.open(url, name, featureWindow);
}

</script>