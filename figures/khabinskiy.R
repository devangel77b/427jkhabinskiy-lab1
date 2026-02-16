library(ggplot2)
library(dplyr)

raw <- read.csv('velocity.csv',header=TRUE)
grouped <- dplyr::group_by(raw,type)

fig <- ggplot(raw, aes(t, v_ms, colour=type)) +
    geom_hline(yintercept=0) +
    geom_point() +
    geom_smooth(method="lm",se=FALSE)+
    xlab('$t$, \\unit{\\second}')+
    ylab('$v$, \\unit{\\meter\\per\\second}')+
    theme_bw()

model1 <- lm(v_ms~t, data=raw)
model2 <- lm(v_ms~t+type, data=raw)
print(anova(model1,model2))
