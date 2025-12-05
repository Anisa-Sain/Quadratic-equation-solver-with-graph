clc
clear
l = 0;
x = [];
xp = -50;
xl =-5;
xll = [];
yll = [];

LOQ = input("linear or quadratic graph (lin or quad) ?","s")

if LOQ == "lin"
    while xl < 5
        yl = xl;
        xll =[xll, xl];
        yll = [yll,yl];
        xl = xl + 1;
        %disp("x11")
        %disp(xll)
        %disp("y11")
        %disp(yll)
    end
    plot(xll,yll, 'm','MarkerSize',20,'MarkerFaceColor','y','MarkerEdgeColor','g','LineWidth',0.5);

else
    while l == 0
        astr = input('input number a: ', "s");
        a = str2double(astr);
        bstr = input("input number b: ", "s");
        b = str2double(bstr);
        cstr= input("input number c: ","s");
        c = str2double(cstr);                %converting variables from strings to numbers
        linestr = input("input number x: ","s");
        line = str2double(linestr)

        if isnan(a)
            disp("a is not valid");
            l = 0;
        else
            disp("a is valid");
            l = 1;
        end

        if isnan(b)
            disp("b is not valid");
            l = 0;
        else
            disp("b is valid");
            l = 1;
        end
   
        if isnan(c)
            disp("c is not valid");
            l = 0;
        else
            disp("c is valid");
            l = 1;
        end
        if isnan(c)
            disp("x is not valid")
            l = 0
        else 
            disp("x is valid")
            l = 1
         
        end                         %checking all inputs are valid real number,
                                %outputting not valid when its not
    end                             %asking for values again if not valid

    discriminant = (b)^2-(4*a*c);
    disp("the discriminant is:")           %calculating the discriminant 
    disp(discriminant)

    if discriminant < 0            %where the output is less than 0, display no real roots
        disp("no real roots")
        while xp <= 50
            yp = (a*(x.^2))+(b*x)+c;       %calculating the y values in regards to x
 
            x =[x xp];
            xp = xp + 0.5;
        end
        x(end:end) = [];    %ensures vectors are same length
        p1 = plot(x,yp, 'm','MarkerSize',20,'MarkerFaceColor','y','MarkerEdgeColor','g','LineWidth',0.5);       %plotting graph
        xlabel("x")
        ylabel("y")
        title("quadratic graph")     
        legend("ax^2 + bx + c")
        grid on;               %labeling axis, titles, legends and adding a grid

    else
        if discriminant == 0     %if output is 0 then dipslay theres one root
            disp("one root found")
        else
            disp("2 roots found")   %if the value is anything else(positive and not 0) then display there are two roots
        end
        dsquare = sqrt(discriminant);
        quadPlus = (-b+(dsquare))/(2*a);
        quadNeg = (-b-(dsquare))/(2*a);       %finding outputs of quadratic formula
    
        if quadPlus == quadNeg
            disp("root: ")
            disp(quadNeg)          %display root for when the discriminant = 0
            while xp <= 50
                yp = (a*(x.^2))+(b*x)+c;   %calculating y values in regards to x
 
                x =[x xp];                 %adding each new xp value to x vector          
                xp = xp + 1; 
            end
            x(end:end) = [];    %ensures vectors are same length
            p1 = plot(x,yp, 'm','MarkerSize',20,'MarkerFaceColor','y','MarkerEdgeColor','g','LineWidth',0.5);
            xlabel("x")
            ylabel("y")
            title("quadratic graph")
            hold on;
            plot(quadNeg,"d:b")
            legend("ax^2 + bx + c", "root")
            grid on;                         %plotting graph, labeling axis, titles, and legend, plotting the root and adding a grid

            x(end:end) = [];      %ensures that x has the same number of value as yp
        else
            disp("roots: ")       %displaying two roots when the discriminant is >0
            disp(quadPlus)
            disp(quadNeg)
       
            while xp <= 50
                yp = (a*(x.^2))+(b*x)+c;    %calculating y values in regards to x 
 
                x =[x xp];
                xp = xp + 1;
            
            end
        x(end:end) = [];   %ensures that vectors x and y are the same length


        p1 = plot(x,yp, 'm','MarkerSize',20,'MarkerFaceColor','y','MarkerEdgeColor','g','LineWidth',0.5);
        xlabel("x")
        ylabel("y")
        title("quadratic graph")
        hold on;
        plot(quadNeg,0, "d:b")
        hold on;
        plot(quadPlus, 0,"d:g")
        legend("ax^2 + bx + c", "root 1", "root 2")
        grid on;                                  %plotting graph, labeling axis, titles and legends, plotting roots and adding a grid
        end 
    
    q = input("would you like to add a linear line(y or n) ?", "s")
    if q == "y"
        while xl < 5
            yl = xl;
            xll =[xll, xl];
            yll = [yll,yl];
            xl = xl + 1;
            %disp("x11")
            %disp(xll)
            %disp("y11")
            %disp(yll)
        end
        hold on;
        plot(xll,yll, 'm','MarkerSize',20,'MarkerFaceColor','y','MarkerEdgeColor','g','LineWidth',0.5);
    else
        disp("ok")
    end

    end
end