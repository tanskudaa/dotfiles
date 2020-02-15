static const char norm_fg[] = "#cfd9d7";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#909796";

static const char sel_fg[] = "#cfd9d7";
static const char sel_bg[] = "#108773";
static const char sel_border[] = "#cfd9d7";

static const char urg_fg[] = "#cfd9d7";
static const char urg_bg[] = "#C75911";
static const char urg_border[] = "#C75911";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
