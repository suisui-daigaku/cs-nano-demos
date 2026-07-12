// /* a hash router */

const home = '<table border="0" width="80%" align="center" cellpadding="10"><tr><td width="50%" valign="top"><h3><b>News & Media</b></h3><ul><li><a href="#news">Latest Headlines</a></li><li><a href="#news">Weather & Stocks</a></li></ul></td><td width="50%" valign="top"><h3><b>Recreation & Sports</b></h3><ul><li><a href="#sports">Pro Baseball</a></li><li><a href="#sports">Football Scores</a></li></ul></td></tr></table>'; 

const news = '<marquee bgcolor="#FFFF00"><font color="#FF0000"><b>BREAKING NEWS:</b> Scientists discover new comet! --- Internet usage surges past 30 million users worldwide! ---</font></marquee><ul><li><b>Today\'s Top Story:</b> The Information Superhighway continues to expand rapidly.</li><li><b>Weather:</b> Overcast with a chance of rain in the Pacific Northwest.</li><li><b>Technology:</b> 56k modems promise faster download speeds for web surfers.</li></ul><center><br><br><p><i>More news links coming soon! Page is under construction.</i></p></center>'; 

const sports = '<div align="center"><table border="2" cellpadding="10" bgcolor="#E0E0E0"><tr><th colspan="2" bgcolor="#000099"><font color="#FFFFFF">Weekend Baseball Results</font></th></tr><tr><td>New York</td><td><b>5</b></td></tr><tr><td>Boston</td><td>3</td></tr><tr><td>Chicago</td><td><b>8</b></td></tr><tr><td>Detroit</td><td>2</td></tr></table></div><center><br><br><hr width="80%"><p><font size="-1">Copyright &copy; 1996 The Web Directory. All rights reserved.</font></p></center>';


function updateContent(header) {
    const contentDiv = document.getElementById('content');
    
    if (header === 'news') {
        contentDiv.innerHTML = news; 
    } else if (header === 'sports') {
        contentDiv.innerHTML = sports;
    } else if (header === '') {
        contentDiv.innerHTML = home;
    } else {
        contentDiv.innerHTML = '<center><h1>404 Not Found</h1></center>';
    }
}

document.addEventListener('DOMContentLoaded', () => {
    updateContent(location.hash.substring(1));  // remove the '#' character. the hash sign is in substring(0)
});


// monitor the hashchange event
window.addEventListener('hashchange', function() {
    updateContent(location.hash.substring(1));  // remove the '#' character. the hash sign is in substring(0)
})


