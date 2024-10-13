<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wyns Portfolio</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* Common styles */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        .email {
            position: fixed;
            bottom: 20px;
            right: 20px;
            color: white;
            text-decoration: none;
            font-size: 14px;
        }

        /* Page 1 styles */
        #page1 {
            background-color: #c8102e; /* Dark Red */
            color: white;
        }

        #page1 h1 {
            font-size: 60px; /* Adjust for mobile */
            text-shadow: 2px 2px 5px #000;
        }

        /* Page 2 styles */
        #page2 {
            background-color: white;
            color: #c8102e; /* Dark Red */
        }

        #page2 img {
            width: 300px; /* Adjust for mobile */
            height: 300px; /* 1:1 ratio */
        }

        /* Page 3 styles */
        #page3 {
            background-color: #c8102e; /* Dark Red */
            color: white;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .social-icons img {
            width: 40px; /* Icon size */
            height: 40px;
        }

        /* Responsive styles */
        @media (max-width: 600px) {
            #page1 h1 {
                font-size: 40px; /* Adjust for mobile */
            }
        }
    </style>
</head>
<body>

    <!-- Page 1 -->
    <div id="page1" class="container">
        <h1>WYNS</h1>
        <a href="#page2" class="email">Next</a>
    </div>

    <!-- Page 2 -->
    <div id="page2" class="container" style="display: none;">
        <div>
            <img src="album_cover.jpg" alt="Album Cover"> <!-- Replace with your album cover image -->
            <h2>WONDA</h2>
        </div>
        <a href="#page3" class="email">Next</a>
    </div>

    <!-- Page 3 -->
    <div id="page3" class="container" style="display: none;">
        <div>
            <h2>FOLLOW:</h2>
            <div class="social-icons">
                <a href="https://www.instagram.com/" target="_blank"><img src="instagram_icon.png" alt="Instagram"></a>
                <a href="https://www.tiktok.com/" target="_blank"><img src="tiktok_icon.png" alt="TikTok"></a>
                <a href="https://www.youtube.com/" target="_blank"><img src="youtube_icon.png" alt="YouTube"></a>
                <a href="https://www.twitter.com/" target="_blank"><img src="twitter_icon.png" alt="Twitter"></a>
                <a href="https://www.facebook.com/" target="_blank"><img src="facebook_icon.png" alt="Facebook"></a>
            </div>
        </div>
        <a href="mailto:wwlabelw@gmail.com" class="email">wwlabelw@gmail.com</a>
    </div>

    <script>
        // Simple script to navigate between pages
        let currentPage = 1;
        const pages = [document.getElementById('page1'), document.getElementById('page2'), document.getElementById('page3')];

        function showPage(pageIndex) {
            pages.forEach((page, index) => {
                page.style.display = (index === pageIndex) ? 'flex' : 'none';
            });
        }

        showPage(currentPage - 1);

        pages.forEach((page, index) => {
            page.querySelector('.email').addEventListener('click', () => {
                currentPage = (index + 1) % pages.length + 1;
                showPage(currentPage - 1);
            });
        });
    </script>
</body>
</html>
