get 95% confidence interval for percentage of users using the discover weekly service<br/>
you are given reach(percentage) and N(total population)

ci = reach +/- 1.96 * se<br/>
we just need to get the se here

wrong answer: se = ((reach*N*(1-reach)^2 + (1-N)*reach*(0-reach)^2)/N)^(1/2)<br/>
right answer: se = sqrt(reach(1-reach)/N)

