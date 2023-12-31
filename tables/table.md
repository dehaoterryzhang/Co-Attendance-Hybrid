# Logit TWFE

| Category     | Period | Baseline | Variable  | PP_Effect |    SE    | CI_Lower | CI_Upper | Relative_Effect |   SE   | CI_Lower_Relative | CI_Upper_Relative |
|--------------|--------|----------|-----------|-----------|----------|----------|----------|-----------------|--------|-------------------|-------------------|
| US           | Post   | 0.2677   | Manager   | 0.0771    | 0.0012   | 0.0747   | 0.0794   | 0.2880          | 0.0049 | 0.2772            | 0.2974            |
| US           | Post   | 0.2677   | Teammates | 0.0423    | 0.0007   | 0.0409   | 0.0438   | 0.1582          | 0.0027 | 0.1540            | 0.1638            |
| US           | Pre    | 0.0935   | Manager   | 0.0393    | 0.0013   | 0.0368   | 0.0418   | 0.4203          | 0.0138 | 0.3969            | 0.4488            |
| US           | Pre    | 0.0935   | Teammates | 0.0123    | 0.0004   | 0.0115   | 0.0131   | 0.1317          | 0.0047 | 0.1240            | 0.1418            |
| India        | Post   | 0.2783   | Manager   | 0.0714    | 0.0023   | 0.0669   | 0.0759   | 0.2566          | 0.0084 | 0.2439            | 0.2766            |
| India        | Post   | 0.2783   | Teammates | 0.0600    | 0.0019   | 0.0563   | 0.0636   | 0.2155          | 0.0065 | 0.2034            | 0.2274            |
| Ireland      | Post   | 0.2844   | Manager   | 0.0822    | 0.0042   | 0.0740   | 0.0904   | 0.2890          | 0.0170 | 0.2610            | 0.3217            |
| Ireland      | Post   | 0.2844   | Teammates | 0.0695    | 0.0034   | 0.0627   | 0.0762   | 0.2443          | 0.0139 | 0.2171            | 0.2728            |
| Eng          | post   | 0.2831   | Manager   | 0.0688    | 0.0014   | 0.0661   | 0.0714   | 0.2430          | 0.0054 | 0.2306            | 0.2538            |
| Eng          | post   | 0.2831   | Teammates | 0.0420    | 0.0009   | 0.0403   | 0.0437   | 0.1484          | 0.0034 | 0.1437            | 0.1556            |
| PM           | post   | 0.2322   | Manager   | 0.0892    | 0.0029   | 0.0835   | 0.0946   | 0.3842          | 0.0134 | 0.3508            | 0.4021            |
| PM           | post   | 0.2322   | Teammates | 0.0378    | 0.0016   | 0.0348   | 0.0407   | 0.1630          | 0.0069 | 0.1514            | 0.1763            |
| Corp         | post   | 0.2355   | Manager   | 0.1031    | 0.0029   | 0.0974   | 0.1085   | 0.4378          | 0.0146 | 0.4056            | 0.4587            |
| Corp         | post   | 0.2355   | Teammates | 0.0443    | 0.0018   | 0.0408   | 0.0475   | 0.1880          | 0.0074 | 0.1699            | 0.2006            |
| New          | post   | 0.2649   | Manager   | 0.0757    | 0.0029   | 0.0703   | 0.0815   | 0.2859          | 0.0114 | 0.2675            | 0.3093            |
| New          | post   | 0.2649   | Teammates | 0.0490    | 0.0018   | 0.0458   | 0.0522   | 0.1849          | 0.0067 | 0.1746            | 0.1992            |
| Existing     | post   | 0.2888   | Manager   | 0.0665    | 0.0015   | 0.0632   | 0.0694   | 0.2302          | 0.0058 | 0.2203            | 0.2447            |
| Existing     | post   | 0.2888   | Teammates | 0.0400    | 0.0010   | 0.0381   | 0.0417   | 0.1384          | 0.0034 | 0.1329            | 0.1460            |
| Private      | post   | 0.3213   | Manager   | 0.0658    | 0.0020   | 0.0619   | 0.0695   | 0.2048          | 0.0067 | 0.1917            | 0.2174            |
| Private      | post   | 0.3213   | Teammates | 0.0402    | 0.0013   | 0.0376   | 0.0426   | 0.1251          | 0.0042 | 0.1169            | 0.1336            |
| Neighborhood | post   | 0.2656   | Manager   | 0.0758    | 0.0021   | 0.0717   | 0.0797   | 0.2854          | 0.0095 | 0.2650            | 0.3015            |
| Neighborhood | post   | 0.2656   | Teammates | 0.0451    | 0.0014   | 0.0423   | 0.0477   | 0.1697          | 0.0056 | 0.1536            | 0.1747            |

Note: Relative effect for manager is the marginal effect of manager's presence in the regression.  Relative effect for teammates is the marginal effect of the fraction of in-person teammates multiplied by the standard deviation of this fraction. 

# Linear TWFE
| Category | Period | Baseline | Variable  | PP_Effect | SE     | Relative_Effect |
|----------|--------|----------|-----------|-----------|--------|-----------------|
| US       | post   | 0.2677   | Manager   | 0.1852    | 0.0032 | 0.6918          |
| US       | post   | 0.2677   | Teammates | 0.0849    | 0.0012 | 0.3171          |
| US       | pre    | 0.0935   | Manager   | 0.1297    | 0.0043 | 1.3872          |
| US       | pre    | 0.0935   | Teammates | 0.0558    | 0.0016 | 0.5968          |

Note: Relative effect for manager is the marginal effect of manager's presence in the regression.  Relative effect for teammates is the marginal effect of the fraction of in-person teammates multiplied by the standard deviation of this fraction. 


# Building:date FEs
| Model                                   | Manager PP effect | SE     | Teammate PP effect (100%   attendance) | SE     |
|-----------------------------------------|-------------------|--------|----------------------------------------|--------|
| Linear, individual FE, date FE          | 0.0851            | 0.0012 | 0.1841                                 | 0.0032 |
| Linear, individual FE, building:date FE | 0.0802            | 0.0012 | 0.1646                                 | 0.0032 |
