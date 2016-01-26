{
  "RedCloth" = {
    version = "4.2.9";
    source = {
      type = "gem";
      sha256 = "06pahxyrckhgb7alsxwhhlx1ib2xsx33793finj01jk8i054bkxl";
      remotes = ["https://rubygems.org"];
    };
  };
  "colorator" = {
    version = "0.1";
    source = {
      type = "gem";
      remotes = ["https://rubygems.org"];
      sha256 = "09zp15hyd9wlbgf1kmrf4rnry8cpvh1h9fj7afarlqcy4hrfdpvs";
    };
  };
  "ffi" = {
    version = "1.9.10";
    source = {
      type = "gem";
      remotes = ["https://rubygems.org"];
      sha256 = "1m5mprppw0xcrv2mkim5zsk70v089ajzqiq5hpyb0xg96fcyzyxj";
    };
  };
  "jekyll" = {
    version = "3.0.1";
    source = {
      type = "gem";
      remotes = ["https://rubygems.org"];
      sha256 = "107svn6r7pvkg9wwfi4r44d2rqppysjf9zf09h7z1ajsy8k2s65a";
    };
    dependencies = [
      "colorator"
      "jekyll-sass-converter"
      "jekyll-watch"
      "kramdown"
      "liquid"
      "mercenary"
      "rouge"
      "safe_yaml"
    ];
  };
  "jekyll-sass-converter" = {
    version = "1.4.0";
    source = {
      type = "gem";
      sha256 = "095757w0pg6qh3wlfg1j1mw4fsz7s89ia4zai5f2rhx9yxsvk1d8";
      remotes = ["https://rubygems.org"];
    };
    dependencies = [
      "sass"
    ];
  };
  "jekyll-watch" = {
    version = "1.3.0";
    source = {
      type = "gem";
      sha256 = "1mqwvrd2hm6ah5zsxqsv2xdp31wl94pl8ybb1q324j79z8pvyarg";
      remotes = ["https://rubygems.org"];
    };
    dependencies = [
      "listen"
    ];
  };
  "kramdown" = {
    version = "1.9.0";
    source = {
      type = "gem";
      sha256 = "12sral2xli39mnr4b9m2sxdlgam4ni0a1mkxawc5311z107zj3p0";
      remotes = ["https://rubygems.org"];
    };
  };
  "liquid" = {
    version = "3.0.6";
    source = {
      type = "gem";
      sha256 = "033png37ym4jrjz5bi7zb4ic4yxacwvnllm1xxmrnr4swgyyygc2";
      remotes = ["https://rubygems.org"];
    };
  };
  "listen" = {
    version = "3.0.5";
    source = {
      type = "gem";
      sha256 = "182wd2pkf690ll19lx6zbk01a3rqkk5lwsyin6kwydl7lqxj5z3g";
      remotes = ["https://rubygems.org"];
    };
    dependencies = [
      "rb-fsevent"
      "rb-inotify"
    ];
  };
  "mercenary" = {
    version = "0.3.5";
    source = {
      type = "gem";
      sha256 = "0ls7z086v4xl02g4ia5jhl9s76d22crgmplpmj0c383liwbqi9pb";
      remotes = ["https://rubygems.org"];
    };
  };
  "rb-fsevent" = {
    version = "0.9.7";
    source = {
      type = "gem";
      sha256 = "1xlkflgxngwkd4nyybccgd1japrba4v3kwnp00alikj404clqx4v";
      remotes = ["https://rubygems.org"];
    };
  };
  "rb-inotify" = {
    version = "0.9.5";
    source = {
      type = "gem";
      sha256 = "0kddx2ia0qylw3r52nhg83irkaclvrncgy2m1ywpbhlhsz1rymb9";
      remotes = ["https://rubygems.org"];
    };
    dependencies = [
      "ffi"
    ];
  };
  "rdiscount" = {
    version = "2.1.8";
    source = {
      type = "gem";
      sha256 = "0vcyy90r6wfg0b0y5wqp3d25bdyqjbwjhkm1xy9jkz9a7j72n70v";
      remotes = ["https://rubygems.org"];
    };
  };
  "rouge" = {
    version = "1.10.1";
    source = {
      type = "gem";
      sha256 = "0wp8as9ypdy18kdj9h70kny1rdfq71mr8cj2bpahr9vxjjvjasqz";
      remotes = ["https://rubygems.org"];
    };
  };
  "safe_yaml" = {
    version = "1.0.4";
    source = {
      type = "gem";
      sha256 = "1hly915584hyi9q9vgd968x2nsi5yag9jyf5kq60lwzi5scr7094";
      remotes = ["https://rubygems.org"];
    };
  };
  "sass" = {
    version = "3.4.20";
    source = {
      type = "gem";
      remotes = ["https://rubygems.org"];
      sha256 = "04rpdcp258arh2wgdk9shbqnzd6cbbbpi3wpi9a0wby8awgpxmyf";
    };
  };
  "RbST" = {
    version = "0.5.1";
    source = {
      type = "gem";
      sha256 = "b201072f6e1a87a6e31295f004d0e3b3be1b9d673de79d14c1eba3ff16954d6d";
    };
  };
}
