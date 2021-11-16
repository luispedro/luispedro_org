/** @typedef {{load: (Promise<unknown>); flags: (unknown)}} ElmPagesInit */

/** @type ElmPagesInit */
export default {
  load: async function (elmLoaded) {
    const app = await elmLoaded;
    console.log("App loaded", app);
    var sc = document.createElement('script');
    sc.src = 'https://platform.twitter.com/widgets.js';
    sc.setAttribute('async', true);
    sc.setAttribute('charset', 'utf-8');
    document.getElementById('twitter-injection-site').appendChild(sc);
  },
  flags: function () {
    return "You can decode this in Shared.elm using Json.Decode.string!";
  },
};
