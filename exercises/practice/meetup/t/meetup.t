#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Meetup qw<meetup>;

is( # begin: d7f8eadd-d4fc-46ee-8a20-e97bd3fd01c8
    meetup("Teenth Monday of May 2013"),
    "2013-05-13",
    "when teenth Monday is the 13th, the first day of the teenth week",
); # end: d7f8eadd-d4fc-46ee-8a20-e97bd3fd01c8

is( # begin: f78373d1-cd53-4a7f-9d37-e15bf8a456b4
    meetup("Teenth Monday of August 2013"),
    "2013-08-19",
    "when teenth Monday is the 19th, the last day of the teenth week",
); # end: f78373d1-cd53-4a7f-9d37-e15bf8a456b4

is( # begin: 8c78bea7-a116-425b-9c6b-c9898266d92a
    meetup("Teenth Monday of September 2013"),
    "2013-09-16",
    "when teenth Monday is some day in the middle of the teenth week",
); # end: 8c78bea7-a116-425b-9c6b-c9898266d92a

is( # begin: cfef881b-9dc9-4d0b-8de4-82d0f39fc271
    meetup("Teenth Tuesday of March 2013"),
    "2013-03-19",
    "when teenth Tuesday is the 19th, the last day of the teenth week",
); # end: cfef881b-9dc9-4d0b-8de4-82d0f39fc271

is( # begin: 69048961-3b00-41f9-97ee-eb6d83a8e92b
    meetup("Teenth Tuesday of April 2013"),
    "2013-04-16",
    "when teenth Tuesday is some day in the middle of the teenth week",
); # end: 69048961-3b00-41f9-97ee-eb6d83a8e92b

is( # begin: d30bade8-3622-466a-b7be-587414e0caa6
    meetup("Teenth Tuesday of August 2013"),
    "2013-08-13",
    "when teenth Tuesday is the 13th, the first day of the teenth week",
); # end: d30bade8-3622-466a-b7be-587414e0caa6

is( # begin: 8db4b58b-92f3-4687-867b-82ee1a04f851
    meetup("Teenth Wednesday of January 2013"),
    "2013-01-16",
    "when teenth Wednesday is some day in the middle of the teenth week",
); # end: 8db4b58b-92f3-4687-867b-82ee1a04f851

is( # begin: 6c27a2a2-28f8-487f-ae81-35d08c4664f7
    meetup("Teenth Wednesday of February 2013"),
    "2013-02-13",
    "when teenth Wednesday is the 13th, the first day of the teenth week",
); # end: 6c27a2a2-28f8-487f-ae81-35d08c4664f7

is( # begin: 008a8674-1958-45b5-b8e6-c2c9960d973a
    meetup("Teenth Wednesday of June 2013"),
    "2013-06-19",
    "when teenth Wednesday is the 19th, the last day of the teenth week",
); # end: 008a8674-1958-45b5-b8e6-c2c9960d973a

is( # begin: e4abd5e3-57cb-4091-8420-d97e955c0dbd
    meetup("Teenth Thursday of May 2013"),
    "2013-05-16",
    "when teenth Thursday is some day in the middle of the teenth week",
); # end: e4abd5e3-57cb-4091-8420-d97e955c0dbd

is( # begin: 85da0b0f-eace-4297-a6dd-63588d5055b4
    meetup("Teenth Thursday of June 2013"),
    "2013-06-13",
    "when teenth Thursday is the 13th, the first day of the teenth week",
); # end: 85da0b0f-eace-4297-a6dd-63588d5055b4

is( # begin: ecf64f9b-8413-489b-bf6e-128045f70bcc
    meetup("Teenth Thursday of September 2013"),
    "2013-09-19",
    "when teenth Thursday is the 19th, the last day of the teenth week",
); # end: ecf64f9b-8413-489b-bf6e-128045f70bcc

is( # begin: ac4e180c-7d0a-4d3d-b05f-f564ebb584ca
    meetup("Teenth Friday of April 2013"),
    "2013-04-19",
    "when teenth Friday is the 19th, the last day of the teenth week",
); # end: ac4e180c-7d0a-4d3d-b05f-f564ebb584ca

is( # begin: b79101c7-83ad-4f8f-8ec8-591683296315
    meetup("Teenth Friday of August 2013"),
    "2013-08-16",
    "when teenth Friday is some day in the middle of the teenth week",
); # end: b79101c7-83ad-4f8f-8ec8-591683296315

is( # begin: 6ed38b9f-0072-4901-bd97-7c8b8b0ef1b8
    meetup("Teenth Friday of September 2013"),
    "2013-09-13",
    "when teenth Friday is the 13th, the first day of the teenth week",
); # end: 6ed38b9f-0072-4901-bd97-7c8b8b0ef1b8

is( # begin: dfae03ed-9610-47de-a632-655ab01e1e7c
    meetup("Teenth Saturday of February 2013"),
    "2013-02-16",
    "when teenth Saturday is some day in the middle of the teenth week",
); # end: dfae03ed-9610-47de-a632-655ab01e1e7c

is( # begin: ec02e3e1-fc72-4a3c-872f-a53fa8ab358e
    meetup("Teenth Saturday of April 2013"),
    "2013-04-13",
    "when teenth Saturday is the 13th, the first day of the teenth week",
); # end: ec02e3e1-fc72-4a3c-872f-a53fa8ab358e

is( # begin: d983094b-7259-4195-b84e-5d09578c89d9
    meetup("Teenth Saturday of October 2013"),
    "2013-10-19",
    "when teenth Saturday is the 19th, the last day of the teenth week",
); # end: d983094b-7259-4195-b84e-5d09578c89d9

is( # begin: d84a2a2e-f745-443a-9368-30051be60c2e
    meetup("Teenth Sunday of May 2013"),
    "2013-05-19",
    "when teenth Sunday is the 19th, the last day of the teenth week",
); # end: d84a2a2e-f745-443a-9368-30051be60c2e

is( # begin: 0e64bc53-92a3-4f61-85b2-0b7168c7ce5a
    meetup("Teenth Sunday of June 2013"),
    "2013-06-16",
    "when teenth Sunday is some day in the middle of the teenth week",
); # end: 0e64bc53-92a3-4f61-85b2-0b7168c7ce5a

is( # begin: de87652c-185e-4854-b3ae-04cf6150eead
    meetup("Teenth Sunday of October 2013"),
    "2013-10-13",
    "when teenth Sunday is the 13th, the first day of the teenth week",
); # end: de87652c-185e-4854-b3ae-04cf6150eead

is( # begin: 2cbfd0f5-ba3a-46da-a8cc-0fe4966d3411
    meetup("First Monday of March 2013"),
    "2013-03-04",
    "when first Monday is some day in the middle of the first week",
); # end: 2cbfd0f5-ba3a-46da-a8cc-0fe4966d3411

is( # begin: a6168c7c-ed95-4bb3-8f92-c72575fc64b0
    meetup("First Monday of April 2013"),
    "2013-04-01",
    "when first Monday is the 1st, the first day of the first week",
); # end: a6168c7c-ed95-4bb3-8f92-c72575fc64b0

is( # begin: 1bfc620f-1c54-4bbd-931f-4a1cd1036c20
    meetup("First Tuesday of May 2013"),
    "2013-05-07",
    "when first Tuesday is the 7th, the last day of the first week",
); # end: 1bfc620f-1c54-4bbd-931f-4a1cd1036c20

is( # begin: 12959c10-7362-4ca0-a048-50cf1c06e3e2
    meetup("First Tuesday of June 2013"),
    "2013-06-04",
    "when first Tuesday is some day in the middle of the first week",
); # end: 12959c10-7362-4ca0-a048-50cf1c06e3e2

is( # begin: 1033dc66-8d0b-48a1-90cb-270703d59d1d
    meetup("First Wednesday of July 2013"),
    "2013-07-03",
    "when first Wednesday is some day in the middle of the first week",
); # end: 1033dc66-8d0b-48a1-90cb-270703d59d1d

is( # begin: b89185b9-2f32-46f4-a602-de20b09058f6
    meetup("First Wednesday of August 2013"),
    "2013-08-07",
    "when first Wednesday is the 7th, the last day of the first week",
); # end: b89185b9-2f32-46f4-a602-de20b09058f6

is( # begin: 53aedc4d-b2c8-4dfb-abf7-a8dc9cdceed5
    meetup("First Thursday of September 2013"),
    "2013-09-05",
    "when first Thursday is some day in the middle of the first week",
); # end: 53aedc4d-b2c8-4dfb-abf7-a8dc9cdceed5

is( # begin: b420a7e3-a94c-4226-870a-9eb3a92647f0
    meetup("First Thursday of October 2013"),
    "2013-10-03",
    "when first Thursday is another day in the middle of the first week",
); # end: b420a7e3-a94c-4226-870a-9eb3a92647f0

is( # begin: 61df3270-28b4-4713-bee2-566fa27302ca
    meetup("First Friday of November 2013"),
    "2013-11-01",
    "when first Friday is the 1st, the first day of the first week",
); # end: 61df3270-28b4-4713-bee2-566fa27302ca

is( # begin: cad33d4d-595c-412f-85cf-3874c6e07abf
    meetup("First Friday of December 2013"),
    "2013-12-06",
    "when first Friday is some day in the middle of the first week",
); # end: cad33d4d-595c-412f-85cf-3874c6e07abf

is( # begin: a2869b52-5bba-44f0-a863-07bd1f67eadb
    meetup("First Saturday of January 2013"),
    "2013-01-05",
    "when first Saturday is some day in the middle of the first week",
); # end: a2869b52-5bba-44f0-a863-07bd1f67eadb

is( # begin: 3585315a-d0db-4ea1-822e-0f22e2a645f5
    meetup("First Saturday of February 2013"),
    "2013-02-02",
    "when first Saturday is another day in the middle of the first week",
); # end: 3585315a-d0db-4ea1-822e-0f22e2a645f5

is( # begin: c49e9bd9-8ccf-4cf2-947a-0ccd4e4f10b1
    meetup("First Sunday of March 2013"),
    "2013-03-03",
    "when first Sunday is some day in the middle of the first week",
); # end: c49e9bd9-8ccf-4cf2-947a-0ccd4e4f10b1

is( # begin: 1513328b-df53-4714-8677-df68c4f9366c
    meetup("First Sunday of April 2013"),
    "2013-04-07",
    "when first Sunday is the 7th, the last day of the first week",
); # end: 1513328b-df53-4714-8677-df68c4f9366c

is( # begin: 49e083af-47ec-4018-b807-62ef411efed7
    meetup("Second Monday of March 2013"),
    "2013-03-11",
    "when second Monday is some day in the middle of the second week",
); # end: 49e083af-47ec-4018-b807-62ef411efed7

is( # begin: 6cb79a73-38fe-4475-9101-9eec36cf79e5
    meetup("Second Monday of April 2013"),
    "2013-04-08",
    "when second Monday is the 8th, the first day of the second week",
); # end: 6cb79a73-38fe-4475-9101-9eec36cf79e5

is( # begin: 4c39b594-af7e-4445-aa03-bf4f8effd9a1
    meetup("Second Tuesday of May 2013"),
    "2013-05-14",
    "when second Tuesday is the 14th, the last day of the second week",
); # end: 4c39b594-af7e-4445-aa03-bf4f8effd9a1

is( # begin: 41b32c34-2e39-40e3-b790-93539aaeb6dd
    meetup("Second Tuesday of June 2013"),
    "2013-06-11",
    "when second Tuesday is some day in the middle of the second week",
); # end: 41b32c34-2e39-40e3-b790-93539aaeb6dd

is( # begin: 90a160c5-b5d9-4831-927f-63a78b17843d
    meetup("Second Wednesday of July 2013"),
    "2013-07-10",
    "when second Wednesday is some day in the middle of the second week",
); # end: 90a160c5-b5d9-4831-927f-63a78b17843d

is( # begin: 23b98ce7-8dd5-41a1-9310-ef27209741cb
    meetup("Second Wednesday of August 2013"),
    "2013-08-14",
    "when second Wednesday is the 14th, the last day of the second week",
); # end: 23b98ce7-8dd5-41a1-9310-ef27209741cb

is( # begin: 447f1960-27ca-4729-bc3f-f36043f43ed0
    meetup("Second Thursday of September 2013"),
    "2013-09-12",
    "when second Thursday is some day in the middle of the second week",
); # end: 447f1960-27ca-4729-bc3f-f36043f43ed0

is( # begin: c9aa2687-300c-4e79-86ca-077849a81bde
    meetup("Second Thursday of October 2013"),
    "2013-10-10",
    "when second Thursday is another day in the middle of the second week",
); # end: c9aa2687-300c-4e79-86ca-077849a81bde

is( # begin: a7e11ef3-6625-4134-acda-3e7195421c09
    meetup("Second Friday of November 2013"),
    "2013-11-08",
    "when second Friday is the 8th, the first day of the second week",
); # end: a7e11ef3-6625-4134-acda-3e7195421c09

is( # begin: 8b420e5f-9290-4106-b5ae-022f3e2a3e41
    meetup("Second Friday of December 2013"),
    "2013-12-13",
    "when second Friday is some day in the middle of the second week",
); # end: 8b420e5f-9290-4106-b5ae-022f3e2a3e41

is( # begin: 80631afc-fc11-4546-8b5f-c12aaeb72b4f
    meetup("Second Saturday of January 2013"),
    "2013-01-12",
    "when second Saturday is some day in the middle of the second week",
); # end: 80631afc-fc11-4546-8b5f-c12aaeb72b4f

is( # begin: e34d43ac-f470-44c2-aa5f-e97b78ecaf83
    meetup("Second Saturday of February 2013"),
    "2013-02-09",
    "when second Saturday is another day in the middle of the second week",
); # end: e34d43ac-f470-44c2-aa5f-e97b78ecaf83

is( # begin: a57d59fd-1023-47ad-b0df-a6feb21b44fc
    meetup("Second Sunday of March 2013"),
    "2013-03-10",
    "when second Sunday is some day in the middle of the second week",
); # end: a57d59fd-1023-47ad-b0df-a6feb21b44fc

is( # begin: a829a8b0-abdd-4ad1-b66c-5560d843c91a
    meetup("Second Sunday of April 2013"),
    "2013-04-14",
    "when second Sunday is the 14th, the last day of the second week",
); # end: a829a8b0-abdd-4ad1-b66c-5560d843c91a

is( # begin: 501a8a77-6038-4fc0-b74c-33634906c29d
    meetup("Third Monday of March 2013"),
    "2013-03-18",
    "when third Monday is some day in the middle of the third week",
); # end: 501a8a77-6038-4fc0-b74c-33634906c29d

is( # begin: 49e4516e-cf32-4a58-8bbc-494b7e851c92
    meetup("Third Monday of April 2013"),
    "2013-04-15",
    "when third Monday is the 15th, the first day of the third week",
); # end: 49e4516e-cf32-4a58-8bbc-494b7e851c92

is( # begin: 4db61095-f7c7-493c-85f1-9996ad3012c7
    meetup("Third Tuesday of May 2013"),
    "2013-05-21",
    "when third Tuesday is the 21st, the last day of the third week",
); # end: 4db61095-f7c7-493c-85f1-9996ad3012c7

is( # begin: 714fc2e3-58d0-4b91-90fd-61eefd2892c0
    meetup("Third Tuesday of June 2013"),
    "2013-06-18",
    "when third Tuesday is some day in the middle of the third week",
); # end: 714fc2e3-58d0-4b91-90fd-61eefd2892c0

is( # begin: b08a051a-2c80-445b-9b0e-524171a166d1
    meetup("Third Wednesday of July 2013"),
    "2013-07-17",
    "when third Wednesday is some day in the middle of the third week",
); # end: b08a051a-2c80-445b-9b0e-524171a166d1

is( # begin: 80bb9eff-3905-4c61-8dc9-bb03016d8ff8
    meetup("Third Wednesday of August 2013"),
    "2013-08-21",
    "when third Wednesday is the 21st, the last day of the third week",
); # end: 80bb9eff-3905-4c61-8dc9-bb03016d8ff8

is( # begin: fa52a299-f77f-4784-b290-ba9189fbd9c9
    meetup("Third Thursday of September 2013"),
    "2013-09-19",
    "when third Thursday is some day in the middle of the third week",
); # end: fa52a299-f77f-4784-b290-ba9189fbd9c9

is( # begin: f74b1bc6-cc5c-4bf1-ba69-c554a969eb38
    meetup("Third Thursday of October 2013"),
    "2013-10-17",
    "when third Thursday is another day in the middle of the third week",
); # end: f74b1bc6-cc5c-4bf1-ba69-c554a969eb38

is( # begin: 8900f3b0-801a-466b-a866-f42d64667abd
    meetup("Third Friday of November 2013"),
    "2013-11-15",
    "when third Friday is the 15th, the first day of the third week",
); # end: 8900f3b0-801a-466b-a866-f42d64667abd

is( # begin: 538ac405-a091-4314-9ccd-920c4e38e85e
    meetup("Third Friday of December 2013"),
    "2013-12-20",
    "when third Friday is some day in the middle of the third week",
); # end: 538ac405-a091-4314-9ccd-920c4e38e85e

is( # begin: 244db35c-2716-4fa0-88ce-afd58e5cf910
    meetup("Third Saturday of January 2013"),
    "2013-01-19",
    "when third Saturday is some day in the middle of the third week",
); # end: 244db35c-2716-4fa0-88ce-afd58e5cf910

is( # begin: dd28544f-f8fa-4f06-9bcd-0ad46ce68e9e
    meetup("Third Saturday of February 2013"),
    "2013-02-16",
    "when third Saturday is another day in the middle of the third week",
); # end: dd28544f-f8fa-4f06-9bcd-0ad46ce68e9e

is( # begin: be71dcc6-00d2-4b53-a369-cbfae55b312f
    meetup("Third Sunday of March 2013"),
    "2013-03-17",
    "when third Sunday is some day in the middle of the third week",
); # end: be71dcc6-00d2-4b53-a369-cbfae55b312f

is( # begin: b7d2da84-4290-4ee6-a618-ee124ae78be7
    meetup("Third Sunday of April 2013"),
    "2013-04-21",
    "when third Sunday is the 21st, the last day of the third week",
); # end: b7d2da84-4290-4ee6-a618-ee124ae78be7

is( # begin: 4276dc06-a1bd-4fc2-b6c2-625fee90bc88
    meetup("Fourth Monday of March 2013"),
    "2013-03-25",
    "when fourth Monday is some day in the middle of the fourth week",
); # end: 4276dc06-a1bd-4fc2-b6c2-625fee90bc88

is( # begin: ddbd7976-2deb-4250-8a38-925ac1a8e9a2
    meetup("Fourth Monday of April 2013"),
    "2013-04-22",
    "when fourth Monday is the 22nd, the first day of the fourth week",
); # end: ddbd7976-2deb-4250-8a38-925ac1a8e9a2

is( # begin: eb714ef4-1656-47cc-913c-844dba4ebddd
    meetup("Fourth Tuesday of May 2013"),
    "2013-05-28",
    "when fourth Tuesday is the 28th, the last day of the fourth week",
); # end: eb714ef4-1656-47cc-913c-844dba4ebddd

is( # begin: 16648435-7937-4d2d-b118-c3e38fd084bd
    meetup("Fourth Tuesday of June 2013"),
    "2013-06-25",
    "when fourth Tuesday is some day in the middle of the fourth week",
); # end: 16648435-7937-4d2d-b118-c3e38fd084bd

is( # begin: de062bdc-9484-437a-a8c5-5253c6f6785a
    meetup("Fourth Wednesday of July 2013"),
    "2013-07-24",
    "when fourth Wednesday is some day in the middle of the fourth week",
); # end: de062bdc-9484-437a-a8c5-5253c6f6785a

is( # begin: c2ce6821-169c-4832-8d37-690ef5d9514a
    meetup("Fourth Wednesday of August 2013"),
    "2013-08-28",
    "when fourth Wednesday is the 28th, the last day of the fourth week",
); # end: c2ce6821-169c-4832-8d37-690ef5d9514a

is( # begin: d462c631-2894-4391-a8e3-dbb98b7a7303
    meetup("Fourth Thursday of September 2013"),
    "2013-09-26",
    "when fourth Thursday is some day in the middle of the fourth week",
); # end: d462c631-2894-4391-a8e3-dbb98b7a7303

is( # begin: 9ff1f7b6-1b72-427d-9ee9-82b5bb08b835
    meetup("Fourth Thursday of October 2013"),
    "2013-10-24",
    "when fourth Thursday is another day in the middle of the fourth week",
); # end: 9ff1f7b6-1b72-427d-9ee9-82b5bb08b835

is( # begin: 83bae8ba-1c49-49bc-b632-b7c7e1d7e35f
    meetup("Fourth Friday of November 2013"),
    "2013-11-22",
    "when fourth Friday is the 22nd, the first day of the fourth week",
); # end: 83bae8ba-1c49-49bc-b632-b7c7e1d7e35f

is( # begin: de752d2a-a95e-48d2-835b-93363dac3710
    meetup("Fourth Friday of December 2013"),
    "2013-12-27",
    "when fourth Friday is some day in the middle of the fourth week",
); # end: de752d2a-a95e-48d2-835b-93363dac3710

is( # begin: eedd90ad-d581-45db-8312-4c6dcf9cf560
    meetup("Fourth Saturday of January 2013"),
    "2013-01-26",
    "when fourth Saturday is some day in the middle of the fourth week",
); # end: eedd90ad-d581-45db-8312-4c6dcf9cf560

is( # begin: 669fedcd-912e-48c7-a0a1-228b34af91d0
    meetup("Fourth Saturday of February 2013"),
    "2013-02-23",
    "when fourth Saturday is another day in the middle of the fourth week",
); # end: 669fedcd-912e-48c7-a0a1-228b34af91d0

is( # begin: 648e3849-ea49-44a5-a8a3-9f2a43b3bf1b
    meetup("Fourth Sunday of March 2013"),
    "2013-03-24",
    "when fourth Sunday is some day in the middle of the fourth week",
); # end: 648e3849-ea49-44a5-a8a3-9f2a43b3bf1b

is( # begin: f81321b3-99ab-4db6-9267-69c5da5a7823
    meetup("Fourth Sunday of April 2013"),
    "2013-04-28",
    "when fourth Sunday is the 28th, the last day of the fourth week",
); # end: f81321b3-99ab-4db6-9267-69c5da5a7823

is( # begin: 1af5e51f-5488-4548-aee8-11d7d4a730dc
    meetup("Last Monday of March 2013"),
    "2013-03-25",
    "last Monday in a month with four Mondays",
); # end: 1af5e51f-5488-4548-aee8-11d7d4a730dc

is( # begin: f29999f2-235e-4ec7-9dab-26f137146526
    meetup("Last Monday of April 2013"),
    "2013-04-29",
    "last Monday in a month with five Mondays",
); # end: f29999f2-235e-4ec7-9dab-26f137146526

is( # begin: 31b097a0-508e-48ac-bf8a-f63cdcf6dc41
    meetup("Last Tuesday of May 2013"),
    "2013-05-28",
    "last Tuesday in a month with four Tuesdays",
); # end: 31b097a0-508e-48ac-bf8a-f63cdcf6dc41

is( # begin: 8c022150-0bb5-4a1f-80f9-88b2e2abcba4
    meetup("Last Tuesday of June 2013"),
    "2013-06-25",
    "last Tuesday in another month with four Tuesdays",
); # end: 8c022150-0bb5-4a1f-80f9-88b2e2abcba4

is( # begin: 0e762194-672a-4bdf-8a37-1e59fdacef12
    meetup("Last Wednesday of July 2013"),
    "2013-07-31",
    "last Wednesday in a month with five Wednesdays",
); # end: 0e762194-672a-4bdf-8a37-1e59fdacef12

is( # begin: 5016386a-f24e-4bd7-b439-95358f491b66
    meetup("Last Wednesday of August 2013"),
    "2013-08-28",
    "last Wednesday in a month with four Wednesdays",
); # end: 5016386a-f24e-4bd7-b439-95358f491b66

is( # begin: 12ead1a5-cdf9-4192-9a56-2229e93dd149
    meetup("Last Thursday of September 2013"),
    "2013-09-26",
    "last Thursday in a month with four Thursdays",
); # end: 12ead1a5-cdf9-4192-9a56-2229e93dd149

is( # begin: 7db89e11-7fbe-4e57-ae3c-0f327fbd7cc7
    meetup("Last Thursday of October 2013"),
    "2013-10-31",
    "last Thursday in a month with five Thursdays",
); # end: 7db89e11-7fbe-4e57-ae3c-0f327fbd7cc7

is( # begin: e47a739e-b979-460d-9c8a-75c35ca2290b
    meetup("Last Friday of November 2013"),
    "2013-11-29",
    "last Friday in a month with five Fridays",
); # end: e47a739e-b979-460d-9c8a-75c35ca2290b

is( # begin: 5bed5aa9-a57a-4e5d-8997-2cc796a5b0ec
    meetup("Last Friday of December 2013"),
    "2013-12-27",
    "last Friday in a month with four Fridays",
); # end: 5bed5aa9-a57a-4e5d-8997-2cc796a5b0ec

is( # begin: 61e54cba-76f3-4772-a2b1-bf443fda2137
    meetup("Last Saturday of January 2013"),
    "2013-01-26",
    "last Saturday in a month with four Saturdays",
); # end: 61e54cba-76f3-4772-a2b1-bf443fda2137

is( # begin: 8b6a737b-2fa9-444c-b1a2-80ce7a2ec72f
    meetup("Last Saturday of February 2013"),
    "2013-02-23",
    "last Saturday in another month with four Saturdays",
); # end: 8b6a737b-2fa9-444c-b1a2-80ce7a2ec72f

is( # begin: 0b63e682-f429-4d19-9809-4a45bd0242dc
    meetup("Last Sunday of March 2013"),
    "2013-03-31",
    "last Sunday in a month with five Sundays",
); # end: 0b63e682-f429-4d19-9809-4a45bd0242dc

is( # begin: 5232307e-d3e3-4afc-8ba6-4084ad987c00
    meetup("Last Sunday of April 2013"),
    "2013-04-28",
    "last Sunday in a month with four Sundays",
); # end: 5232307e-d3e3-4afc-8ba6-4084ad987c00

is( # begin: 0bbd48e8-9773-4e81-8e71-b9a51711e3c5
    meetup("Last Wednesday of February 2012"),
    "2012-02-29",
    "when last Wednesday in February in a leap year is the 29th",
); # end: 0bbd48e8-9773-4e81-8e71-b9a51711e3c5

is( # begin: fe0936de-7eee-4a48-88dd-66c07ab1fefc
    meetup("Last Wednesday of December 2014"),
    "2014-12-31",
    "last Wednesday in December that is also the last day of the year",
); # end: fe0936de-7eee-4a48-88dd-66c07ab1fefc

is( # begin: 2ccf2488-aafc-4671-a24e-2b6effe1b0e2
    meetup("Last Sunday of February 2015"),
    "2015-02-22",
    "when last Sunday in February in a non-leap year is not the 29th",
); # end: 2ccf2488-aafc-4671-a24e-2b6effe1b0e2

is( # begin: 00c3ce9f-cf36-4b70-90d8-92b32be6830e
    meetup("First Friday of December 2012"),
    "2012-12-07",
    "when first Friday is the 7th, the last day of the first week",
); # end: 00c3ce9f-cf36-4b70-90d8-92b32be6830e

done_testing;
