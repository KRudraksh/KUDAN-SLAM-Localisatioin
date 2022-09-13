#ifndef KDROS_CONVERT_H_
#define KDROS_CONVERT_H_

#include <KdLidar.hpp>
#include <KdSharedLidarStructs/LlaUtil.hpp>
#include <KdMaths.hpp>
#include <KdTime/Duration.hpp>

#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <geometry_msgs/PoseStamped.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/NavSatFix.h>
#include <sensor_msgs/PointCloud.h>
#include <sensor_msgs/PointCloud2.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>


class KdRosConvert
{
  public:
    KdRosConvert() {};
    ~KdRosConvert() {};
    
    static tf2::Transform TransformFromKdMatrix4(const Kd::Se3F& pose);

    static sensor_msgs::PointCloud2 PointCloudFromMapPoints(
      const std::vector<Kd::Vec3F>& mapPoints, const std::string& mapFrameId, const ros::Time& currentFrameTime);

    static sensor_msgs::PointCloud2 PointCloudFromLidarPoints(
      const std::vector<Kd::LidarPoint>& lidarPoints, const std::string& mapFrameId, const ros::Time& currentFrameTime);

    static bool AppendKdLidarPointsFromMsg(const sensor_msgs::PointCloud2& point_cloud2lidarPoints,
      std::vector<Kd::LidarPoint>& lidarPoints);

    static Kd::ImuSampleF KdImuSampleFromMsg(const sensor_msgs::Imu& imu);

    static Kd::PoseConstraint KdPoseConstraintFromMsg(const sensor_msgs::NavSatFix& gps);

    static void KdImageSampleFromMsg(const sensor_msgs::CompressedImage& msgImage, Kd::ImageSample& sample, int resize);

};

#endif // KDROS_CONVERT_H_