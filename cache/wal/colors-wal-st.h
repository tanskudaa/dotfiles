const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#C75911", /* red     */
  [2] = "#108773", /* green   */
  [3] = "#E1A229", /* yellow  */
  [4] = "#52708B", /* blue    */
  [5] = "#069C95", /* magenta */
  [6] = "#47BFB9", /* cyan    */
  [7] = "#cfd9d7", /* white   */

  /* 8 bright colors */
  [8]  = "#909796",  /* black   */
  [9]  = "#C75911",  /* red     */
  [10] = "#108773", /* green   */
  [11] = "#E1A229", /* yellow  */
  [12] = "#52708B", /* blue    */
  [13] = "#069C95", /* magenta */
  [14] = "#47BFB9", /* cyan    */
  [15] = "#cfd9d7", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#cfd9d7", /* foreground */
  [258] = "#cfd9d7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
