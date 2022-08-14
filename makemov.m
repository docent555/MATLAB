function makemov(s1,s2,s3)

v = VideoWriter('movie_test.avi');
open(v);

for i = s1:s2:s3
    fprintf('Reading %08.4f.bmp\n', i);
    Im = imread(sprintf('%08.4f.bmp', i));    
    frame = im2frame(Im);
    writeVideo(v,frame);
end

close(v);
end

