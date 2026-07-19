/** @typedef {{load: (Promise<unknown>); flags: (unknown)}} ElmPagesInit */

/** @type ElmPagesInit */
export default {
  load: async function (elmLoaded) {
    const app = await elmLoaded;
    var sc = document.createElement('script');
    sc.setAttribute('src', "https://www.googletagmanager.com/gtag/js?id=G-88H22CZHSL");
    sc.setAttribute('async', true);
    document.getElementById('google-injection-site').appendChild(sc);

    sc = document.createElement('script');
    sc.setAttribute('src', "https://badge.dimensions.ai/badge.js");
    sc.setAttribute('async', true);
    document.getElementById('google-injection-site').appendChild(sc);


    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-88H22CZHSL');

    app.ports.updatePath.subscribe(function(path) {
        gtag('event', 'page_view', {page_path: '/'+path});
    });
  },
  flags: function () {
    return "You can decode this in Shared.elm using Json.Decode.string!";
  },
};
