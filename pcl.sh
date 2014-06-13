echo "compiling $1"
if [[ $1 == *.c ]]
then
    gcc -ggdb -Wno-deprecated -I/usr/include/pcl-1.7 -I/usr/lib -I/usr/include/eigen3 -I/usr/include/vtk-5.8 `pkg-config --cflags opencv` -o `basename $1 .c` $1 `pkg-config --libs pcl_apps-1.7 pcl_common-1.7 pcl_features-1.7 pcl_filters-1.7 pcl_geometry-1.7 pcl_io-1.7 pcl_kdtree-1.7 pcl_keypoints-1.7 pcl_octree-1.7 pcl_registration-1.7 pcl_sample_consensus-1.7 pcl_search-1.7 pcl_segmentation-1.7 pcl_surface-1.7 pcl_tracking-1.7 pcl_visualization-1.7 flann` `pkg-config --libs opencv` -lboost_filesystem -lboost_system;
elif [[ $1 == *.cpp ]]
then
    g++ -ggdb -Wno-deprecated  -I/usr/include/vtk-5.8/vtk -I/usr/include/pcl-1.7 -I/usr/include/eigen3 `pkg-config --cflags opencv`  -o `basename $1 .cpp` $1 `pkg-config --libs pcl_apps-1.7 pcl_common-1.7 pcl_features-1.7 pcl_filters-1.7 pcl_geometry-1.7 pcl_io-1.7 pcl_kdtree-1.7 pcl_keypoints-1.7 pcl_octree-1.7 pcl_registration-1.7 pcl_sample_consensus-1.7 pcl_search-1.7 pcl_segmentation-1.7 pcl_surface-1.7 pcl_tracking-1.7 pcl_visualization-1.7 flann ` `pkg-config --libs opencv` -lboost_filesystem -lboost_system -L/usr/lib -lvtkCommon -lvtkFiltering -lvtkftgl -lvtkGraphics -lvtkImaging -lvtkIO  -lvtkRendering -lboost_thread;
else
    echo "Please compile only .c or .cpp files"
fi
echo "Output file => ${1%.*}"
