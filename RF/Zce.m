% Example common-emitter amplifier
function Ze = Zce()
  Ze = zeros(2);
  Ze(1,1) = 175.93 - 573.11*i;
  Ze(1,2) =  11.45 + 2.87*i;
  Ze(2,1) = -10181 + 38838*i;
  Ze(2,2) = 205.93 - 206.55*i;
end