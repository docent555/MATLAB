function mymovie(a,ak,ht,x)

v = VideoWriter('newfile.avi','Motion JPEG AVI');
open(v)
w=0:127;
tmax = (size(a,2)-1)*ht;
akmax = max(max(ak));
amax = max(max(a));
figure('Position',[50 50 1500 600])
for k = 1:size(a,2)
    subplot(1,2,1)
	stem(w,ak(:,k),'LineWidth',1)    
 	axis([0 127 0 akmax])
    set(gca,'Fontsize',16)        
%     title(['\tau = ', num2str((k-1)*ht)])    
    xlabel('k')
    ylabel('|A_k|')
%     set(gca,'LineWidth',2)
    subplot(1,2,2)
    plot(x,a(:,k),'LineWidth',1)
    axis([0 x(end) 0 amax])
    set(gca,'Fontsize',16)
    xlabel('x')
    ylabel('|A|')
    str_e = sprintf('%0.3f',(k-1)*ht);
    sgtitle(['\tau = ', str_e, '   (\tau_{max} = ',num2str(tmax), ')'])
	frame = getframe(gcf);
    writeVideo(v,frame);
    disp(k)
end
close(v)

end
