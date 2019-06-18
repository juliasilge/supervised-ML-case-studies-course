import React from 'react'
import { graphql } from 'gatsby'

import Layout from '../components/layout'
import { Link } from '../components/link'
import Logo from '../../static/logo.svg'

import classes from '../styles/index.module.sass'

export default ({ data }) => {
    const siteMetadata = data.site.siteMetadata
    const chapters = data.allMarkdownRemark.edges.map(({ node }) => ({
        slug: node.fields.slug,
        title: node.frontmatter.title,
        description: node.frontmatter.description,
    }))
    return (
        <Layout isHome>
            <Logo className={classes.logo} aria-label={siteMetadata.title} />
            <section>
                <h1 className={classes.subtitle}>A Free, Interactive Course Using Tidy Tools</h1>
                <div className={classes.introduction}>
                <p>
                    Predictive modeling, or supervised machine learning, is a powerful tool for using data to make predictions about the world around us. Once you understand the basic ideas of supervised machine learning, the next step is to practice your skills so you know how to apply these techniques wisely and appropriately. In this course, you will work through four case studies using data from the real world; you will gain experience in exploratory data analysis, preparing data so it is ready for predictive modeling, training supervised machine learning models, and evaluating those models.
                </p>
                <p>
                    To take this course, you need some familiarity with tidyverse packages like <strong>dplyr</strong> and <strong>ggplot2</strong> and exposure to machine learning basics. Now let's get started!
                </p>
                </div>
            </section>
            {chapters.map(({ slug, title, description }) => (
                <section key={slug} className={classes.chapter}>
                    <h2 className={classes.chapterTitle}>
                        <Link hidden to={slug}>
                            {title}
                        </Link>
                    </h2>
                    <p className={classes.chapterDesc}>
                        <Link hidden to={slug}>
                            {description}
                        </Link>
                    </p>
                </section>
            ))}
        </Layout>
    )
}

export const pageQuery = graphql`
    {
        site {
            siteMetadata {
                title
            }
        }
        allMarkdownRemark(
            sort: { fields: [frontmatter___title], order: ASC }
            filter: { frontmatter: { type: { eq: "chapter" } } }
        ) {
            edges {
                node {
                    fields {
                        slug
                    }
                    frontmatter {
                        title
                        description
                    }
                }
            }
        }
    }
`
