#boring_vs_interesting.R

library(RColorBrewer)
library(viridislite)
br = rev(brewer.pal(11, 'RdBu'))
blues = rev(brewer.pal(9, 'Blues'))

dat = read.csv("/Users/dougmcneall/Desktop/M2D+Workshop+questionnaire_msedit.csv")

belief = dat[,'Do.you.believe.global.warming.is.caused.by.human.activities']
worried = dat[,'How.worried.are.you.about.global.warming']
domore = dat[,'Do.you.think.people.should.do.more.']
dempol = dat[,'DemPol']
occur = dat[,'occur']

png('/Users/dougmcneall/Desktop/belief_v_worried.png')
par(mar = c(5,5,2,2), las = 1)
plot(jitter(belief), jitter(worried),
     xlab = '', ylab = ''
     )
title(xlab = 'Do you believe global warming\n is caused by human activities?',line = 3)
title(ylab = 'How worried are you\n about global warming?', line = 3)
dev.off()

png('/Users/dougmcneall/Desktop/belief_vs_domore.png')
par(mar = c(5,5,2,2), las = 1)
plot(jitter(belief), jitter(domore),
     xlab = '', ylab = ''
     )
title(xlab = 'Do you believe global warming\n is caused by human activities?',line = 3)
title(ylab = 'Do you think people should do more?', line = 3)
dev.off()

png('/Users/dougmcneall/Desktop/belief_vs_dempol.png')
par(mar = c(5,5,2,2), las = 1)
plot(jitter(belief), jitter(dempol),
     xlab = '', ylab = ''
)
title(xlab = 'Do you believe global warming\n is caused by human activities?',line = 3)
title(ylab = 'DemPol', line = 3)
dev.off()

png('/Users/dougmcneall/Desktop/belief_vs_occur.png')
par(mar = c(5,5,2,2), las = 1)
plot(jitter(belief), jitter(occur),
     xlab = '', ylab = ''
)
title(xlab = 'Do you believe global warming\n is caused by human activities?',line = 3)
title(ylab = 'Occur', line = 3)
dev.off()

plotmax = 50
tab1 = table(belief, domore)
tab2 = table(belief,worried)
tab3 = table(belief, dempol)
tab4 = table(belief, occur)
image(as.matrix(tab1)[tab1 < plotmax], zlim = c(0,plotmax), col = blues)
image(table(belief,worried) < plotmax, zlim = c(50, plotmax), col = blues)

heatmap(tab1, Rowv = NA, Colv = NA, scale = 'none', col = blues)
heatmap(tab2, Rowv = NA, Colv = NA, scale = 'none', col = blues)


