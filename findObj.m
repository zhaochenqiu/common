function re_obj = findObj(image)

[imgrow imgcolumn] = size(image);

re_obj = [];

startr = 1;
startc = 1;

objjudge = 0;

while objjudge == 0
    [startr startc ifget] = getFirstPt(image,1,1);
    
    
    if ifget == 0
        objjudge = 1;
    else
        ptstack = [];
        ptstack = stackpush(ptstack,[startr startc]);
        filljudge = 0;
        
        minr = imgrow;
        minc = imgcolumn;
        maxr = 0;
        maxc = 0;
        
        while filljudge == 0
            [ptstack pt] = stackpop(ptstack);
            
            oldr = pt(1);
            oldc = pt(2);

            minr = min(minr,oldr);
            minc = min(minc,oldc);
            maxr = max(maxr,oldr);
            maxc = max(maxc,oldc);

            if image(oldr,oldc,3) == 255
                image(oldr,oldc,1) = 0;
                image(oldr,oldc,2) = 0;
                image(oldr,oldc,3) = 0;
            end

            r = oldr - 1;
            c = oldc;
            r = max(1,r);
            if image(r,c,3)  == 255
                ptstack = stackpush(ptstack,[r c]);
            end

            r = oldr;
            c = oldc - 1;
            c = max(1,c);
            if image(r,c,3)  == 255
                ptstack = stackpush(ptstack,[r c]);
            end

            r = oldr + 1;
            c = oldc;
            r = min(imgrow,r);
            if image(r,c,3)  == 255
                ptstack = stackpush(ptstack,[r c]);
            end

            r = oldr;
            c = oldc + 1;
            c = min(imgcolumn,c);
            if image(r,c,3)  == 255
                ptstack = stackpush(ptstack,[r c]);
            end

            [row column] = size(ptstack);
            if row == 0
                filljudge = 1;
            end
        end
        
        re_obj = [minr minc maxr maxc;re_obj];
    end
end