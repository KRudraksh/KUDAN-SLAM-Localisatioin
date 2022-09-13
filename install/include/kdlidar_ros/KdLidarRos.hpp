#ifndef KDLIDAR_ROS_NODE_H_
#define KDLIDAR_ROS_NODE_H_

#include "kdlidar_ros/KdRosConvert.hpp"
#include "kdlidar_ros_msgs/SaveMap.h"
#include "kdlidar_ros_msgs/TrackingState.h"

#include <KdLidar.hpp>
#include <KdMaths.hpp>
#include <KdTime/Duration.hpp>
#include <KdSharedLidarStructs/LlaUtil.hpp>

#include <kdlidar_ros/dynamic_reconfigureConfig.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>

#include <dynamic_reconfigure/server.h>
#include <geometry_msgs/PoseStamped.h>
#include <message_filters/subscriber.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <message_filters/time_synchronizer.h>
#include <nav_msgs/Path.h>
#include <opencv2/core/core.hpp>
#include <ros/ros.h>
#include <ros/time.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/image_encodings.h>
#include <std_srvs/Trigger.h>
#include "tf2_ros/transform_broadcaster.h"
#include <tf/transform_broadcaster.h>

#include <memory>
#include <mutex>
#include <vector>

class KdLidarRos
{
public:
    KdLidarRos(ros::NodeHandle& nodeHandle);
    ~KdLidarRos();

private:
    void PublishMapPoints(const std::vector<Kd::Vec3F>& mapPoints);
    void PublishLidarPoints(const std::vector<Kd::LidarPoint>& lidarPoints);
    void PublishFramePoints(const std::vector<Kd::Vec3F>& framePoints);
    void PublishPositionAsTransform(const tf2::Transform& pose);
    void PublishPositionAsPoseStamped(const tf2::Transform& pose);
    void PublishPositionAsLLA();
    void PublishTrackingState();

    void PclCallback(const sensor_msgs::PointCloud2ConstPtr& pointCloud);
    void PclCallback(
        const sensor_msgs::PointCloud2ConstPtr& lidar1,
        const sensor_msgs::PointCloud2ConstPtr& lidar2);
    void ImuCallback(const sensor_msgs::ImuConstPtr& imu);
    void GpsCallback(const sensor_msgs::NavSatFixConstPtr& gps);
    void ImageCallback(const sensor_msgs::CompressedImageConstPtr& msgImage);

    void ParamsChangedCallback(kdlidar_ros::dynamic_reconfigureConfig& config, uint32_t level);
    bool SaveMapSrv(kdlidar_ros_msgs::SaveMap::Request& req, kdlidar_ros_msgs::SaveMap::Response& res);
    bool RematchStoredFramesSrv(std_srvs::TriggerRequest& req, std_srvs::TriggerResponse& res);
    void Update();
    std::unique_ptr<Kd::LidarSlam> slam;
    std::vector<Kd::LidarPoint> lidarPoints;
    ros::Time currentFrameTime;
    std::shared_ptr<tf2_ros::TransformBroadcaster> tfBroadcaster;

    // For imu mode
    bool useImu;
    std::mutex imuMutex;
    std::vector<Kd::ImuSampleF> imuData;

    // For gps mode
    bool useGps;
    std::mutex gpsMutex;
    std::vector<Kd::PoseConstraint> gpsData;

    // For multiple lidar mode
    bool useMultiLidar;
    tf::Transform lidar2Tolidar1;

    // For image relocalisation mode
    bool useImage;
    std::mutex imageMutex;
    std::vector<Kd::ImageSample> imageData;

    ros::Subscriber pclSubscriber;
    ros::Subscriber imuSubscriber;
    ros::Subscriber gpsSubscriber;
    ros::Subscriber imageSubscriber;

    typedef message_filters::sync_policies::
        ApproximateTime<sensor_msgs::PointCloud2, sensor_msgs::PointCloud2>
            syncPolicy;
    message_filters::Subscriber<sensor_msgs::PointCloud2>* lidar1Subscriber;
    message_filters::Subscriber<sensor_msgs::PointCloud2>* lidar2Subscriber;
    message_filters::Synchronizer<syncPolicy>* synchronizer;

    dynamic_reconfigure::Server<kdlidar_ros::dynamic_reconfigureConfig> dynamicParamServer;

    ros::Publisher mapPointsPublisher;
    ros::Publisher lidarPointsPublisher;
    ros::Publisher framePointsPublisher;
    ros::Publisher posePublisher;
    ros::Publisher pathPublisher;
    ros::Publisher statePublisher;
    ros::Publisher llaPublisher;
    nav_msgs::Path path;

    ros::ServiceServer serviceServer;
    ros::ServiceServer rematchStoredFramesServer;

    std::string nodeName;
    std::string mapFrameId;
    std::string lidarFrameId;
    std::string mapFileName;
    std::string gpsCalibFileName;
    bool loadMap;
    bool publishPointCloud;
    bool publishFramesPointCloud;
    bool publishPose;
    bool forceLostEveryFrame;
    int lastNumberOfKeyframes = -1;

    // for IMU mode
    std::vector<double> imuToLidarTran;
    std::vector<double> imuToLidarRot;

    // for GPS mode
    std::vector<double> gpsToLidarTran;
    std::vector<double> gpsToLidarRot;
};

#endif // KDLIDAR_ROS_NODE_H_