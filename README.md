# Barstool News

## Assumptions
- Currently all of our network requests are GET requests. This is sufficent for the current project, but in reality our `NetworkService` class should handle all different types of network requests. For example, if we had a login, it would most likely require a PUT request. 
- In terms of the feature, I assumed that one page of content would be sufficient. However, most real apps usually have infinite scroll implemented for features like this. If we were to remove this assumption, I would use the `UIScrollViewDelegate` to implement paginated requests.

## Edge Cases
- Handled: 
    - Loading flag -- I noticed that quick consecutive taps on a cell can result in unintended multiple network requests resulting in multiple detail screens. I've handled this by creating a flag that will be set to true if there is a network request in progress ensuring that only one request is processed at any given time. 
- Not handled:
    - Potential failure to load posts -- there is a possibility that the posts do not load for a variety of reasons (no internet service, server outage, etc.). In this case it is ideal to allow the user to refresh the screen manually.

## Improvements
- Have our `NetworkService` class handle all types of url requests. This can be done simply by passing a method parameter that other services can pass when calling the perform request method. 
- If the initial request to fetch the posts has failed, we can show a button that the user can press to reattempt to fetch the posts. In order to display the button, we can check if the count of posts is 0 then show a refresh button. 
- In order to implement infinite scroll, we can use the `UIScrollViewDelegate` to fetch the next page of posts when the user has reached the bottom of the collection view. On the `PostManager`, we can create a page property that simply keeps track of the number of pages that has been loaded. Thus, it will know which page to fetch for upon each call. 
- Currently, we are not caching any images that have been loaded. We can create an image cache using the `NSCache` class, using the url as keys and the UIImage object as the values. In the UIImageView+URL.swift file, we can make the update to check the cache for a given url first before making a network request. 
