function [re_minr re_minc re_maxr re_maxc re_image] = fillImage(image)

[imgrow imgcolumn] = size(image);

minr = imgrow;
minc = imgcolumn;
maxr = 0;
maxc = 0;

judge = 0;

ptstack = [];
[r c] = getFirstPt(image,1,1);
ptstack = stackpush(ptstack,[r c]);

while judge == 0
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
        judge = 1;
    end
end

re_image = image;
re_minr = minr;
re_minc = minc;
re_maxr = maxr;
re_maxc = maxc;