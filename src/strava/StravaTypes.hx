package strava;

import tink.Url;

import datetime.DateTime;

@:observable
abstract Dataz(String) from String to String{
	function new(s:String){
		this =s;
	}


	@:to
	public function toDate():DateTime{
		return DateTime.fromString(this);
	}

	

	@:to
	public function toDateString():String{
		return DateTime.fromString(this).toString();
	}
}


class StravaTypes {}



typedef Nodef = Dynamic;
typedef PolylineMap=Nodef;



typedef Stradate = Dataz;

typedef ActivityType=Nodef;
typedef MetaAthlete=Nodef;
typedef LatLng=Nodef;
typedef SummarySegment=Nodef;
typedef Club = Nodef;
typedef SummaryAthlete={
    >LightAthlete,
}


typedef LightAthlete = {
	var id(default,never):Int;
	// 1234567890987654321,
	var username(default,never):String;
	// "marianne_v",
	var resource_state(default,never):Int;
	// 3,
	var firstname(default,never):String;
	// "Marianne",
	var lastname(default,never):String;
	// "V.",
	var profile_medium(default,never):Url;
	// "https://xxxxxx.cloudfront.net/pictures/athletes/123456789/123456789/2/medium.jpg",
	var athlete_type(default,never):Athlete_type;
	// 1,
}
///athlete/activities
@:observable
typedef LightActivities=Array<LightAct>;

@:observable
typedef LightAct={
var id(default,never):Int;
var athlete(default,never):MetaAthlete;
var name(default,never):String;
var distance(default,never):Float;
var moving_time(default,never):Int;
var total_elevation_gain(default,never):Float;
var type(default,never):ActivityType;
var start_date(default,never):Stradate;
var start_date_local(default,never):Stradate;
var start_latlng(default,never):LatLng;
var end_latlng(default,never):LatLng;
var workout_type(default,never):Null<Int>;
var average_speed(default,never):Float;
var max_speed(default,never):Float;

}



@:enum abstract Athlete_type(Int) {
    var superType =1;
}




typedef Bike = {
	id:Int,
	// "b12345678987655",
	primary:Bool,
	name:String,
	// "EMC",
	resource_state:Int,
	// 2,
	distance:Float
}

typedef Shoe = Bike;

typedef Athlete = {
	id:Int,
	// 1234567890987654321,
	username:String,
	// "marianne_v",
	resource_state:Int,
	// 3,
	firstname:String,
	// "Marianne",
	lastname:String,
	// "V.",
	city:String,
	// "San Francisco",
	state:String,
	// "CA",
	country:String,
	// "US",
	sex:String,
	// "F",
	premium:Bool,
	// true,
	created_at:Stradate,
	// "2017-11-14T02:30:05Z",
	updated_at:Stradate,
	// "2018-02-06T19:32:20Z",
	badge_type_id:Int,
	// 4,
	profile_medium:Url,
	// "https://xxxxxx.cloudfront.net/pictures/athletes/123456789/123456789/2/medium.jpg",
	profile:Url,
	// "https://xxxxx.cloudfront.net/pictures/athletes/123456789/123456789/2/large.jpg",
	friend:String,
	// null,
	follower:String,
	// null,
	follower_count:Int,
	// 5,
	friend_count:Int,
	// 5,
	mutual_friend_count:Int,
	// 0,
	athlete_type:Athlete_type,
	// 1,
	date_preference:String,
	// "%m/%d/%Y",
	measurement_preference:String,
	// "feet",
	clubs:Array<Club>,
	ftp:Nodef,
	// null,
	weight:Float,
	bikes:Array<Bike>,
	shoes:Array<Shoe>
}

///activities/{id}
typedef Activity={
 id:Int,
// 	The unique identifier of the activity
 external_id:String,
// 	The identifier provided at upload time
 upload_id:Int,
// 	The identifier of the upload that resulted in this activity
 athlete:MetaAthlete,
// 	An instance of MetaAthlete.
 name:String,
// 	The name of the activity
 distance:Float,
// 	The activity's distance, in meters
 moving_time:Int,
// 	The activity's moving time, in seconds
 elapsed_time:Int,
// 	The activity's elapsed time, in seconds
 total_elevation_gain:Float,
// 	The activity's total elevation gain.
 elev_high:Float,
// 	The activity's highest elevation, in meters
 elev_low:Float,
// 	The activity's lowest elevation, in meters
 type:ActivityType,
// 	An instance of ActivityType.
 start_date:Stradate,
// 	The time at which the activity was started.
 start_date_local:Stradate,
// 	The time at which the activity was started in the local timezone.
 timezone:String,
// 	The timezone of the activity
 start_latlng:LatLng,
// 	An instance of LatLng.
 end_latlng:LatLng,
// 	An instance of LatLng.
 achievement_count:Int,
// 	The number of achievements gained during this activity
 kudos_count:Int,
// 	The number of kudos given for this activity
 comment_count:Int,
// 	The number of comments for this activity
 athlete_count:Int,
// 	The number of athletes for taking part in a group activity
 photo_count:Int,
// 	The number of Instagram photos for this activity
 total_photo_count:Int,
// 	The number of Instagram and Strava photos for this activity
 map:PolylineMap,
// 	An instance of PolylineMap.
 trainer:Bool,
// 	Whether this activity was recorded on a training machine
 commute:Bool,
// 	Whether this activity is a commute
 manual:Bool,
// 	Whether this activity was created manually
 _private:Bool,
// 	Whether this activity is private
 flagged:Bool,
// 	Whether this activity is flagged
 workout_type:Null<Int>,
// 	The activity's workout type
 average_speed:Float,
// 	The activity's average speed, in meters per second
 max_speed:Float,
// 	The activity's max speed, in meters per second
 has_kudoed:Bool,
// 	Whether the logged-in athlete has kudoed this activity
 gear_id:String,
// 	The id of the gear for the activity
 kilojoules:Float,
// 	The total work done in kilojoules during this activity. Rides only
 average_watts:Float,
// 	Average power output in watts during this activity. Rides only
 device_watts:Bool,
// 	Whether the watts are from a power meter, false if estimated
 max_watts:Int,
// 	Rides with power meter data only
 weighted_average_watts:Int,
// 	Similar to Normalized Power. Rides with power meter data only 


has_heartrate:Bool,
}


///athletes/{id}/routes
typedef Routes =Array<Routes>;


///routes/{id}
typedef Route={

athlete:SummaryAthlete,
//SummaryAthlete 	An instance of SummaryAthlete.
description:String,
//String 	The description of the route
distance:Float,
//Float 	The route's distance, in meters
elevation_gain:Float,
//Float 	The route's elevation gain.
id:Int,
//Int 	The unique identifier of this route
map:PolylineMap,
//PolylineMap 	An instance of PolylineMap.
name:String,
//String 	The name of this route

_private:Bool,
//Bool 	Whether this route is private
starred:Bool,
//Bool 	Whether this route is starred by the logged-in athlete
timestamp:Int,
//Int 	An instance of Int.
type:Int,
//Int 	This route's type (1 for ride, 2 for runs)
sub_type:Int,
//Int 	This route's sub-type (1 for road, 2 for mountain bike, 3 for cross, 4 for trail, 5 for mixed)
segments:SummarySegment,
//SummarySegment 	The segments traversed by this route
directions:Nodef,
//#/RouteDirection 	The directions of this route

}

typedef Stats={
biggest_ride_distance:Float,
// 	The longest distance ridden by the athlete.
biggest_climb_elevation_gain:Float,
// 	The highest climb ridden by the athlete.
recent_ride_totals:ActivityTotal,
// 	The recent (last 4 weeks) ride stats for the athlete.
recent_run_totals:ActivityTotal,
// 	The recent (last 4 weeks) run stats for the athlete.
recent_swim_totals:ActivityTotal,
// 	The recent (last 4 weeks) swim stats for the athlete.
ytd_ride_totals:ActivityTotal,
// 	The year to date ride stats for the athlete.
ytd_run_totals:ActivityTotal,
// 	The year to date run stats for the athlete.
ytd_swim_totals:ActivityTotal,
// 	The year to date swim stats for the athlete.
all_ride_totals:ActivityTotal,
// 	The all time ride stats for the athlete.
all_run_totals:ActivityTotal,
// 	The all time run stats for the athlete.
all_swim_totals:ActivityTotal,
// 	The all time swim stats for the athlete. 
}

typedef ActivityTotal={
//A roll-up of metrics pertaining to a set of activities. Values are in seconds and meters.
count:Int,
//The number of activities considered in this total.
distance:Float,
//The total distance covered by the considered activities.
moving_time:Int,
//The total moving time of the considered activities.
elapsed_time:Int,
//The total elapsed time of the considered activities.
elevation_gain:Float,
//The total elevation gain of the considered activities.
achievement_count:Int,
//The total number of achievements of the considered activities. 
}
