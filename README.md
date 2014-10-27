UIView-Mask
===========

Easy way to mask a UIView from IB
  
you'll find a category holding this line
<pre>
@property (nonatomic, strong) IBInspectable UIImage *imgMask;
</pre>
this does all the magic, so in IB you can find a field to set the image you want to use as a Mask   
Img Mask

<img border="0" src="./IB_Inspector.png" alt="IB" width="320" height="480">

as you can see it is a UIImageview with this image setted
<img border="0" src="./ViewMask/ViewMask/Images.xcassets/oie_transparent.imageset/oie_transparent.png" alt="gasmask" width="200" height="200">   

and using this image as mask
<img border="0" src="./ViewMask/ViewMask/Images.xcassets/oie_transparent-2.imageset/oie_transparent-2.png" alt="gasmask" width="200" height="200">   

so here is the result.   
<img border="0" src="./iOS Simulator.png" alt="IB" width="375" height="667">
