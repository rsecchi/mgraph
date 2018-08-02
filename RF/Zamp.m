% Example common-emitter amplifier
function Ze = Zamp()
  Ze = zeros(2);
  Ze(1,1) = 712.4 - 992.2*i;
  Ze(1,2) =  3.6 + 2.5*i;
  Ze(2,1) = -13859 + 19358*i;
  Ze(2,2) = 128.65 - 50.74*i;
end