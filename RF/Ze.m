% Example common-base amplifier
function Ze = Ze()
  Ze = zeros(2);
  Ze(1,1) = 22.18 + i*5.36;
  Ze(1,2) = 12.19 + i*5.60;
  Ze(2,1) = 464.7 - i*371.0;
  Ze(2,2) = 472.3 - i*374.9;
end