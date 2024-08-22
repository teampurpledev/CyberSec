# Becoming the phisher 🦑

## Training a security mindset with internal spearphishing campaigns

It’s widely known that when it comes to training, making the material engaging makes it more memorable and likely to change behavior [1]. If you watch people take security training you see their eyes glaze as their mind wanders during the mandatory video essays. This is an issue because even as recently as May 2024, banks are still suffering breaches due to an employee clicking on a malicious internet link [2].

In order to make security awareness resonate with learners, it’s important to introduce novel techniques in the training to make learners willing and engaged participants. The core idea behind Becoming the phisher is to put the learner in the shoes of an adversary that uses targeted phishing tactics. Once the learner has sent their own internal phishing message in a controlled environment, it will provide awareness of how modern social engineering has adapted to be near effortless and yet still effective social engineering strategy. This awareness should instill caution when clicking on potentially malicious links.

### Running the exercise

The learner can use AI-generated content however, it should be noted that simply asking a service like ChatGPT to write a fraudulent email does not comply with OpenAI’s usage policies. The learner must specify in their request that this is for training purposes to get a response from ChatGPT that may reflect this sample below:

### Generic example prompt
You're a senior Cybersecurity Analyst. Draft a training phishing email template.

### ChatGPT 4.0 response

Subject: Urgent: Account Verification Required
--- 


```Dear [Employee Name],
We have detected suspicious activity on your company account, and we need your immediate attention to secure your information. As a precaution, we have temporarily suspended your account until the issue can be resolved.
To reactivate your account, please verify your identity by clicking the link below:

[Verify Your Account Now]

Failure to verify your account within 24 hours will result in permanent suspension. Please take this matter seriously to avoid any disruptions to your work.
Thank you for your prompt attention to this urgent matter.
Sincerely,

[IT Support Team]

[Your Company Name]
```

This template likely won’t fool even the hastiest of readers into clicking whatever link you stashed in [Verify Your Account Now]. I’m writing this with the hope that you added something [innocuous yet funny](https://www.youtube.com/watch?v=xvFZjo5PgG0).

We could enhance this message by updating our prompt with specifics about the company and who the target audience, but for security and privacy it is better to edit the template so that it appears legitimate.

### Do not share trade secrets with OpenAI

**Do not share information with OpenAI that you would not want to publish on the internet**. The OpenAI Privacy Policy as of Jan 31, 2024 states, in short, that they may collect your content and use it for training in Europe and anything else everywhere else. Users from any region can opt out of their data being used for training on OpenAI [privacy portal](https://privacy.openai.com/policies?modal=take-control) page.

### Supplemental Training

This training should be accompanied by incident response procedures, so learners know what they should do when they are targeted by genuine phishing attempts. This additional training should include but not be limited to:

- How to report an incident
- How to safely inspect links, for external examination use https://www.virustotal.com/gui/home/url
- How to identify a suspicious attachment

### Expected End Result

The goal of this exercise is to demonstrate how effortless it is to create tailored, custom phishing messages, known as spearphishing, that can fool almost anyone with enough context and visual signals of legitimacy. **It is with this newfound mindset that the learner will be more aware of the potentially advanced levels of social engineering**.

With this newfound awareness of how easy it is to deceive another person and rewarding this behavior of detecting deceit, your learner will adapt their behavior and check before they click.

### References

[1] Security Magazine. (2020, September 23). Security awareness training key to changing security culture. Security Magazine RSS. https://www.securitymagazine.com/articles/93443-security-awareness-training-key-to-changing-security-culture 

[2] Cybersecurity incident. Evolve Bank & Trust. (2024, July 9). https://www.getevolved.com/about/news/cybersecurity-incident/ 
