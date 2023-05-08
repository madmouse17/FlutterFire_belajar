# FLUTTER FIREBASE CLOUD MESAGGING BELAJAR

LARAVEL SOURCE

## Backend Laravel

Install library [fcm/kawancoding](https://github.com/kawankoding/laravel-fcm)

```bash
   $recipients = [
            'caHT8m68SKOF****'
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

    