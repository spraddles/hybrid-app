GOALS:
1. to have one app (i.e. codebase) to deploy anywhere (URL, iOS, Android)
2. to use one simple file to handle config (i.e. variables & URL's) & make sure Github [secrets] are used
3. to keep the logic separated from the front end (to make decoupling to a new UI simpler)
4. to provide a simple CLI to build & deploy (for all cases, including targeted: e.g. deploy_url, deploy_ios, deploy_android, deploy_all)
5. to provide a library of common frontend templates (login, post list, post edit, user list, user edit, cpt list, cpt edit)
6. to show some examples of a custom API endpoint & how to bring that into the frontend (e.g. https://anchor.host/getting-started-with-axios-and-wordpress)'
7. to use JWT tokens & protected routes


POSSIBLE WAYS TO USE THIS REPO:

* build for web URL testing (e.g. Localhost)
* build for iOS or Android, or both
* build for multi-device & deploy (URL, iOS, Android)


SERVER:
GCP


BACKEND:
wordpress
JWT


FRONTEND:
vue (frontend)
framework7 (mobile frontend)
bootstrap (desktop / responsive frontend)
router
vuex (store)
axios (http client)

