list=("ImportCourseEntitlementTask" "ImportStudentCourseEnrollmentTask" "ImportAuthUserTask" "ImportAuthUserProfileTask" "ImportCourseUserGroupTask" "ImportCourseUserGroupUsersTask" "ImportShoppingCartOrder" "ImportShoppingCartOrderItem" "ImportShoppingCartCertificateItem" "ImportShoppingCartPaidCourseRegistration" "ImportShoppingCartDonation" "ImportShoppingCartCourseRegistrationCodeItem" "ImportShoppingCartCoupon" "ImportShoppingCartCouponRedemption" "ImportEcommerceUser" "ImportProductCatalog" "ImportProductCatalogClass" "ImportProductCatalogAttributes" "ImportProductCatalogAttributeValues" "ImportCurrentRefundRefundLineState" "ImportCurrentOrderState" "ImportCurrentOrderLineState" "ImportCurrentOrderDiscountState" "ImportCouponVoucherIndirectionState" "ImportCouponVoucherState" "ImportEcommercePartner" "ImportCourseModeTask" "ImportGeneratedCertificatesTask" "ImportPersistentCourseGradeTask")




for f in ${list[@]}
do
echo $f
PYTHONPATH='.' luigi --module database_imports $f --local-scheduler --destination "hdfs://localhost:9000/edx-analytics-pipeline/warehouse/" --credentials "/edx/etc/edx-analytics-pipeline/input.json" --database "edxapp" --overwrite 
done
