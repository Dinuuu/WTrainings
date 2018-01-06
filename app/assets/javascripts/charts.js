$(document).ready(function(){
$.ajax({ url: "api/v1/charts/summary_info" + window.location.search,
        context: document.body,
        success: function(response){
        	document.getElementById('woloxers-trained').innerHTML=response.woloxers_trained;
          document.getElementById('trainings-given').innerHTML=response.trainings_given;
          document.getElementById('distinct-woloxers-trained').innerHTML=response.distinct_woloxers_trained;
        }});
});