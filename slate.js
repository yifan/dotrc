// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000,
  "orderScreensLeftToRight" : true
});

// Monitors
var monExternal  = "2560x1600";
var monLaptop = "1280x800";

// Operations
var lapFull = S.op("move", {
  "screen" : monLaptop,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});
var lapChat = S.op("corner", {
  "screen" : monLaptop,
  "direction" : "top-left",
  "width" : "screenSizeX/9",
  "height" : "screenSizeY"
});
var lapMain = lapChat.dup({ "direction" : "top-right", "width" : "8*screenSizeX/9" });
var extFull = S.op("move", {
  "screen" : monExternal,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});
var extBig = S.op("move", {
  "screen" : monExternal,
  "x" : "screenOriginX+screenSizeX/3",
  "y" : "screenOriginY",
  "width" : "screenSizeX*2/3",
  "height" : "screenSizeY",
});
var extLeft = extFull.dup({ "width" : "screenSizeX/2" });
var extRight = extLeft.dup({ "x" : "screenSizeX/2" });
var extLeftTop = extLeft.dup({ "height" : "screenSizeY/2" });
var extLeftBot = extLeftTop.dup({ "y" : "screenSizeY/2" });
var extRightTop = extRight.dup({ "height" : "screenSizeY/2" });
var extRightBot = extRightTop.dup({ "y" : "screenSizeY/2" });

// common layout hashes
var lapMainHash = {
  "operations" : [lapMain],
  "ignore-fail" : true,
  "repeat" : true
};
var lapFullHash = {
  "operations" : [lapFull],
  "ignore-fail" : true,
  "repeat" : true
};
var extBigHash = {
  "operations" : [extBig],
  "sort-title" : true,
  "repeat" : true
};
var extFullHash = {
  "operations" : [extFull],
  "sort-title" : true,
  "repeat" : true
};
var genBrowserHash = function(regex) {
  return {
    "operations" : [function(windowObject) {
      var title = windowObject.title();
      if (title !== undefined && title.match(regex)) {
        windowObject.doOperation(extLeftBot);
      } else {
        windowObject.doOperation(lapFull);
      }
    }],
    "ignore-fail" : true,
    "repeat" : true
  };
}

// 2 monitor layout
var twoMonitorLayout = S.lay("twoMonitor", {
  "MacVim" : extBigHash,
  "iTerm" : extFullHash,
  "Xcode" : extBigHash,
  "Google Chrome" : genBrowserHash(/^Developer\sTools\s-\s.+$/),
  "Firefox" : genBrowserHash(/^Firebug\s-\s.+$/),
  "Safari" : lapFullHash,
});

// 1 monitor layout
var oneMonitorLayout = S.lay("oneMonitor", {
  "MacVim" : lapFullHash,
  "iTerm" : lapFullHash,
  "Google Chrome" : lapFullHash,
  "Xcode" : lapFullHash,
  "Firefox" : lapFullHash,
  "Safari" : lapFullHash,
});

// Defaults
S.def(2, twoMonitorLayout);
S.def(1, oneMonitorLayout);

// Layout Operations
var twoMonitor = S.op("layout", { "name" : twoMonitorLayout });
var oneMonitor = S.op("layout", { "name" : oneMonitorLayout });
var universalLayout = function() {
  // Should probably make sure the resolutions match but w/e
  S.log("SCREEN COUNT: "+S.screenCount());
  if (S.screenCount() === 2) {
    twoMonitor.run();
  } else if (S.screenCount() === 1) {
    oneMonitor.run();
  }
};

// Batch bind everything. Less typing.
S.bnda({

  // Basic Location Bindings
  "1:ctrl,alt,cmd" : extLeftTop,
  "2:ctrl,alt,cmd" : extRightTop,
  "3:ctrl,alt,cmd" : extLeftBot,
  "4:ctrl,alt,cmd" : extRightBot,
  "left:ctrl,alt,cmd" : extLeft,
  "right:ctrl,alt,cmd" : extRight,
  "up:ctrl,alt,cmd" : extFull,

  // Resize Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "right:ctrl" : S.op("resize", { "width" : "+10%", "height" : "+0" }),
  "left:ctrl" : S.op("resize", { "width" : "-10%", "height" : "+0" }),
  "up:ctrl" : S.op("resize", { "width" : "+0", "height" : "-10%" }),
  "down:ctrl" : S.op("resize", { "width" : "+0", "height" : "+10%" }),
  "right:alt" : S.op("resize", { "width" : "-10%", "height" : "+0", "anchor" : "bottom-right" }),
  "left:alt" : S.op("resize", { "width" : "+10%", "height" : "+0", "anchor" : "bottom-right" }),
  "up:alt" : S.op("resize", { "width" : "+0", "height" : "+10%", "anchor" : "bottom-right" }),
  "down:alt" : S.op("resize", { "width" : "+0", "height" : "-10%", "anchor" : "bottom-right" }),

  // Push Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "right:ctrl;shift" : S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/2" }),
  "left:ctrl;shift" : S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/2" }),
  "up:ctrl;shift" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" }),
  "down:ctrl;shift" : S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" }),

  // Nudge Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "right:ctrl;alt" : S.op("nudge", { "x" : "+10%", "y" : "+0" }),
  "left:ctrl;alt" : S.op("nudge", { "x" : "-10%", "y" : "+0" }),
  "up:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "-10%" }),
  "down:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "+10%" }),

});

// Log that we're done configuring
S.log("[SLATE] -------------- Finished Loading Config --------------");
