# A color-based objective quality metric for point cloud contents

In recent years, point clouds have gained popularity as a promising representation for volumetric contents in immersive scenarios. Standardization bodies such as MPEG have been developing new compression standards for point cloud contents to reduce the volume of data, while maintaining an acceptable level of visual quality. To do so, reliable metrics are needed in order to automatically estimate the perceptual quality of degraded point cloud contents. Whereas several objective metrics have been developed to assess the geometrical impairment of degraded point cloud contents, fewer publications have been devoted to evaluating color artifacts.
In this paper, we propose new color-based objective metrics for quality evaluation of point cloud contents. Our work extracts color statistics from both reference and degraded point cloud contents, in order to assess the level of impairment.
Using publicly available ground-truth data, we compare the performance of our proposed work with state-of-the-art metrics, and we demonstrate how the color metrics are able to achieve comparable results with respect to widely adopted solutions. 
Moreover, we combine color- and geometry-based metrics in order to provide a global quality score. The novelty of our works resides in simultaneously taking both degradation types into account, while being independent of the rendering process.
Results show that our solution is able to overcome the limitations of focusing on only one type of degradation, achieving better performance with respect to current metrics.

If you use this code, please cite our paper:

    @inproceedings{viola2020color,
	    Author = {Viola, Irene and Subramanyam, Shishir and Cesar, Pablo},
	    Title = {A color-based objective quality metric for point cloud contents},
	    Booktitle  = {2020 Twelfth International Conference on Quality of Multimedia Experience (QoMEX)},
	    Year = {2020},
      Organization = {IEEE}
    }
