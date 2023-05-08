# FLUTTER FIREBASE CLOUD MESAGGING BELAJAR

LARAVEL SOURCE

## Backend Laravel

Install library [fcm/kawancoding](https://github.com/kawankoding/laravel-fcm)

```bash
   $recipients = [
            'caHT8m68SKOFt3VKZj9nz1:APA91bG_gTaornODLWXB96yeJJ5UgAv2Iy2BQxWWsVB9CU-WbMnt8KkSxuM4BgREw4n3-yLPgBylyKHjA9QLGj-nv67m_s8yHVJxaDnuJrvvYuYUFAitI4M5P9eH1_Kvu2H2Mr3GN_Si'
        ];
  return  fcm()
    // ->toTopic('all') // $topic must an string (topic name)
    ->to($recipients)
    ->priority('high')
    ->timeToLive(0)
    ->notification([
        'title' => 'Test FCM',
        'body' => 'This is a test of FCM2',
    ])
    ->data([
        'msgId' => '1',
    ])
    // ->enableResponseLog()
    ->send();
```

    