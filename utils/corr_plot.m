function corr_plot( I0, title_str )
    if nargin == 1
        title_str = ''
    end
    
    A = floor(randi(254, 2000, 2)) + 1;
    x = A(:, 1);
    y = A(:, 2);

    for ii = 1:2000
        v1(ii) = I0(x(ii), y(ii));
        v2(ii) = I0(x(ii), y(ii) + 1);
    end
    figure
    plot(v1, v2, ' + ')
    axis([0, 255, 0, 255])
    xlabel('Pixel gray value on location ($x$, $y$)', 'interpreter', 'latex')
    ylabel('Pixel gray value on location ($x$, $y$ + 1)', 'interpreter', 'latex')
    title(title_str)
    set(gca, 'FontName', 'Times New Roman', 'FontSize',  12, 'LineWidth', 0.5);
    for ii = 1:2000
        v1(ii) = I0(x(ii), y(ii));
        v2(ii) = I0(x(ii) + 1, y(ii));
    end
    figure
    plot(v1, v2, ' + ')
    axis([0, 255, 0, 255])
    xlabel('Pixel gray value on location ($x$, $y$)', 'interpreter', 'latex')
    ylabel('Pixel gray value on location ($x$ + 1, $y$)', 'interpreter', 'latex')
    title(title_str)
    set(gca, 'FontName', 'Times New Roman', 'FontSize',  12, 'LineWidth', 0.5);
    
    for ii = 1:2000
        v1(ii) = I0(x(ii), y(ii));
        v2(ii) = I0(x(ii) + 1, y(ii) + 1);
    end
    
    figure
    plot(v1, v2, ' + ')
    axis([0, 255, 0, 255])
    xlabel('Pixel gray value on location ($x$, $y$)', 'interpreter', 'latex')
    ylabel('Pixel gray value on location ($x$ + 1, $y$ + 1)', 'interpreter', 'latex')
    title(title_str)
    set(gca, 'FontName', 'Times New Roman', 'FontSize',  12, 'LineWidth', 0.5);
end